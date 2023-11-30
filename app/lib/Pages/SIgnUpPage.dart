import 'package:Yene/Models/SignUpPageModel.dart';
import 'package:Yene/services/AuthServices.dart';
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
                    CustomButton(
                      label: 'Sign Up',
                      onPressed: () async {
                        if (data.password != data.confirmPassword) {
                          showSnackbar(context, text: 'Passwords do not match');
                          return;
                        }
                        if (data.checkSignUpData()) {
                          showSnackbar(context);
                          print("fill all fields");
                          data.printAndGetData();
                          return;
                        } else {
                          final result = await signUp(data.printAndGetData());
                          if (result != null && result['success'] == true) {
                            successSnackbar(context,
                                text: result['data']['message']);
                            Navigator.popAndPushNamed(context, 'login');
                          } else if (result['success'] == false) {
                            showSnackbar(context,
                                text: result['data']['message']);
                          } else {
                            showSnackbar(context,
                                text: 'Error: Please try again!!');
                          }
                        }
                      },
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
