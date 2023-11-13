import 'package:Yene/Models/SignUpPageModel.dart';
import 'package:Yene/util/widgets.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _selectedGender = "";
  final data = SignUpData();

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
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Create an Account',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 116, 59, 107),
                      ),
                    ),
                    SizedBox(height: 20),
                    InputBox(
                      inputLabel: "Full Name",
                      placeHolder: "Enter your Full Name",
                      icon: Icon(Icons.person),
                      update: (value) {
                        data.full_name = value;
                      },
                    ),
                    SizedBox(height: 20),
                    InputBox(
                      inputLabel: "Nick Name",
                      placeHolder: "Enter your Nick Name",
                      icon: Icon(Icons.person),
                      update: (value) {
                        data.nick_name = value;
                      },
                    ),
                    SizedBox(height: 10),
                    InputBox(
                      inputLabel: "Phone Number",
                      placeHolder: "Enter your Phone Number",
                      icon: Icon(Icons.phone),
                      update: (value) {
                        data.phone_number = value;
                      },
                      isPhone: true,
                    ),
                    SizedBox(height: 10),
                    InputBox(
                      inputLabel: "Password",
                      placeHolder: "Enter your Password",
                      icon: Icon(Icons.lock),
                      isPassword: true,
                      update: (value) {
                        data.password = value;
                      },
                    ),
                    SizedBox(height: 10),
                    InputBox(
                      inputLabel: "Confirm Password",
                      placeHolder: "Enter your Password Agsin",
                      icon: Icon(Icons.lock),
                      isPassword: true,
                      update: (value) {
                        data.confirmPassword = value;
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: <Widget>[
                        Text('Gender:'),
                        Row(
                          children: <Widget>[
                            Radio(
                              value: 'Male',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                  data.gender = _selectedGender;
                                });
                              },
                            ),
                            Text('Male'),
                            Radio(
                              value: 'Female',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                  data.gender = _selectedGender;
                                });
                              },
                            ),
                            Text('Female'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      onPressed: () async {
                        if (data.password != data.confirmPassword) {
                          print("##########################################");
                        }
                        data.printAndGetData();
                      },
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromARGB(255, 116, 59, 107),
                              Color.fromARGB(255, 100, 58, 97)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          constraints: const BoxConstraints(
                            maxWidth: 200,
                          ),
                          child: const Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Already have an account?"),
                        TextButton(
                          onPressed: () async {
                            // Navigate to the login page
                            await Navigator.popAndPushNamed(
                              context,
                              'login',
                            );
                          },
                          child: Text(
                            'Log In',
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
