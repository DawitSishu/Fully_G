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
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(15.0, 0, 0, 15),
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
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return UpdateProfile(
                                        buttonText: "Update Your Profile");
                                  },
                                );
                              },
                            ),
                          ],
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
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertForm(buttonText: "Insert Partner's Love ID");
                  },
                );
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertForm(
                                buttonText: "Insert Partner's Love ID");
                          },
                        );
                      },
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

class AlertForm extends StatefulWidget {
  final String buttonText;

  const AlertForm({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  State<AlertForm> createState() => _AlertFormState();
}

class _AlertFormState extends State<AlertForm> {
  String data = '';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 116, 59, 107),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            widget.buttonText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          InputBox(
            inputLabel: "Lover Id",
            placeHolder: "Enter your Partner's Love Id",
            update: (value) {
              data = value;
            },
            icon: Icon(Icons.favorite),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              primary: Color.fromARGB(255, 116, 59, 107),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            onPressed: () {
              print(data);
            },
            child: Text(
              'Submit',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UpdateProfile extends StatefulWidget {
  final String buttonText;

  const UpdateProfile({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String data = '';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 116, 59, 107),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            widget.buttonText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          InputBox(
            inputLabel: "Full Name",
            placeHolder: "Enter your Full Name",
            update: (value) {
              data = value;
            },
            icon: Icon(Icons.person),
          ),
          const SizedBox(height: 20),
          InputBox(
            inputLabel: "Nick Name",
            placeHolder: "Enter your Nick Name",
            update: (value) {
              data = value;
            },
            icon: Icon(Icons.person_2_rounded),
          ),
          const SizedBox(height: 20),
          InputBox(
            inputLabel: "Phone Number",
            placeHolder: "Enter your Phone Number",
            update: (value) {
              data = value;
            },
            icon: Icon(Icons.phone),
          ),
          const SizedBox(height: 20),
          InputBox(
            inputLabel: "Password",
            placeHolder: "Enter your new Password",
            update: (value) {
              data = value;
            },
            icon: Icon(Icons.lock),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              primary: Color.fromARGB(255, 116, 59, 107),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            onPressed: () {
              print(data);
            },
            child: Text(
              'Update',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
