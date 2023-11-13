import 'package:Yene/util/widgets.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
        color: Color.fromARGB(255, 68, 7, 65));

    const pageDecoration = PageDecoration(
      bodyTextStyle: bodyStyle,
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.only(top: 30),
      bodyAlignment: Alignment.topCenter,
      imageAlignment: Alignment.topCenter,
      bodyFlex: 0,
      imageFlex: 0,
      safeArea: 0,
    );

    final Orientation orientation = MediaQuery.of(context).orientation;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: Colors.transparent,
          pages: [
            PageViewModel(
              title: "",
              body: "Discover the World of Possibilities",
              image: Image.asset(
                'assets/images/t1.png',
                height: 300,
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "",
              body: "Unlock a World of Creativity and Innovation",
              image: Image.asset(
                'assets/images/t2.png',
                height: 300,
              ),
              decoration: pageDecoration,
            ),
            PageViewModel(
              useScrollView: false,
              title: "",
              image: Image.asset(
                'assets/images/t3.png',
                height: 300,
              ),
              bodyWidget: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const WidgetSpace(
                      space: 25,
                      child: Text(
                        'Join Us Today and Experience Excellence!',
                        style: bodyStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      onPressed: () async {
                        // Navigate to the login screen
                        await Navigator.popAndPushNamed(
                          context,
                          'login',
                        );
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 225, 44, 199),
                              Color.fromARGB(255, 255, 64, 249)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          constraints: const BoxConstraints(
                            maxWidth: 250,
                          ),
                          child: const Center(
                            child: Text(
                              'Get Started',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: pageDecoration,
            ),
          ],
          showSkipButton: false,
          skipOrBackFlex: 0,
          nextFlex: 0,
          showBackButton: false,
          showDoneButton: false,
          showNextButton: false,
          controlsMargin: const EdgeInsets.all(16),
          dotsDecorator: const DotsDecorator(
            size: Size(10.0, 10.0),
            color: Colors.white,
            activeSize: Size(10.0, 10.0),
            activeColor: Color.fromARGB(255, 255, 64, 249),
          ),
        ),
      ),
    );
  }
}
