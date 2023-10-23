import 'package:app/Pages/OnboardingPage.dart';
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
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => OnboardingScreen(),
    },
  ));
}
