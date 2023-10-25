import 'package:app/Pages/AddMemoryPage.dart';
import 'package:app/Pages/CreatorHomePage.dart';
import 'package:app/Pages/LoginPage.dart';
import 'package:app/Pages/OnboardingPage.dart';
import 'package:app/Pages/PaymentPage.dart';
import 'package:app/Pages/SIgnUpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// #e12cc7
void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
  ));
  runApp(MaterialApp(
    title: 'Yene',
    theme: ThemeData(
      fontFamily: 'Poppins',
    ),
    initialRoute: 'payment',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => OnboardingScreen(),
      'login': (context) => LoginPage(),
      'signup': (context) => SignUpPage(),
      'uploadMemory': (context) => AddMemory(),
      'main': (context) => CreatorMainPage(),
      'payment': (context) => PaymentPage(),
    },
  ));
}
