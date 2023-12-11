import 'package:Yene/Models/SignInPageModel.dart';
import 'package:Yene/services/AuthServices.dart';
import 'package:Yene/util/widgets.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final data = SignInData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/bg.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 116, 59, 107),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InputBox(
                      inputLabel: 'Phone Number',
                      icon: const Icon(Icons.person),
                      placeHolder: '09 *******',
                      isPhone: true,
                      update: (value) {
                        data.phone = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    InputBox(
                      inputLabel: 'Password',
                      icon: const Icon(Icons.lock),
                      placeHolder: '*********',
                      isPassword: true,
                      update: (value) {
                        data.password = value;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      label: 'Log In',
                      onPressed: () async {
                        if (data.checkSignInData()) {
                          showSnackbar(context);
                          return;
                        }
                        final response = await LogIn(data.printAndGetData());
                        if (response['success'] == true) {
                          successSnackbar(context,
                              text: response['data']['message']);
                          await Navigator.popAndPushNamed(
                            context,
                            'main',
                          );
                        } else {
                          showSnackbar(context,
                              text: response['data']['message']);
                          return;
                        }
                      },
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 173, 88, 161),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () async {
                            await Navigator.popAndPushNamed(
                              context,
                              'signup',
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color.fromARGB(255, 173, 88, 161),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
