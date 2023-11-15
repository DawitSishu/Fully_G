import 'package:Yene/util/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreatorProfile extends StatefulWidget {
  const CreatorProfile({super.key});

  @override
  State<CreatorProfile> createState() => _CreatorProfileState();
}

class _CreatorProfileState extends State<CreatorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      Color.fromARGB(255, 116, 59, 107),
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              // SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Full Name",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                    ],
                                  ),
                                  Text("Creating Memories Together"),
                                ],
                              ),
                              IconButton(
                                icon: Icon(Icons.edit,
                                    size: 35,
                                    color: Color.fromARGB(255, 116, 59, 107)),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.person,
                                    color: Color.fromARGB(255, 116, 59, 107),
                                    size: 32,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "nickname",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              // Row(
                              //   children: <Widget>[
                              //     Icon(
                              //       Icons.favorite,
                              //       color: Colors.red,
                              //       size: 32,
                              //     ),
                              //     SizedBox(width: 10),
                              //     RichText(
                              //       text: TextSpan(
                              //         style: TextStyle(
                              //           fontSize: 20,
                              //           fontWeight: FontWeight.bold,
                              //           color: Colors
                              //               .black, // You can customize the text color
                              //         ),
                              //         children: <TextSpan>[
                              //           TextSpan(text: "My Love: "),
                              //           TextSpan(
                              //             text: "babe",
                              //             style: TextStyle(
                              //               color: Color.fromARGB(255, 116, 59,
                              //                   107), // Customize the text color
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     )
                              //   ],
                              // ),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.phone,
                                    color: Color.fromARGB(255, 116, 59, 107),
                                    size: 32,
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "+251 9********",
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 32,
                                  ),
                                  SizedBox(width: 10),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors
                                            .black, // You can customize the text color
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(text: "Love ID: "),
                                        TextSpan(
                                          text: "12348",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 116, 59, 107)),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.show_chart,
                                color: Color.fromARGB(255, 116, 59, 107),
                                size: 32,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Love percentage",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              StatsCircularIndicator(percent: 75),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () async {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                print('Heart Icon Clicked');
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: IconButton(
                      color: Colors.red,
                      padding: const EdgeInsets.all(0),
                      iconSize: 30,
                      alignment: Alignment.centerRight,
                      onPressed: () {},
                      icon: FaIcon(
                        FontAwesomeIcons.heartCirclePlus,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "ADD ID",
                    style: TextStyle(
                      fontSize: 18,
                      // fontWeight: FontWeight.bold,
                      // color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('logout');
              },
              child: Row(
                children: [
                  IconButton(
                    color: const Color.fromARGB(255, 116, 59, 107),
                    padding: const EdgeInsets.all(0),
                    iconSize: 30,
                    alignment: Alignment.centerRight,
                    onPressed: () {},
                    icon: const Icon(Icons.logout_outlined),
                  ),
                  const Text('Log out'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatsCircularIndicator extends StatelessWidget {
  final double percent;

  StatsCircularIndicator({required this.percent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            value: percent / 100,
            strokeWidth: 4,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              Color.fromARGB(255, 116, 59, 107),
            ),
          ),
        ),
        Text(
          '$percent%',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
