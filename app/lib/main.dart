import 'package:app/Pages/AddMemoryPage.dart';
import 'package:app/Pages/CreatorMainPage.dart';
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
    initialRoute: 'main',
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


//integrate tehe beating hear in the home keza u can add the connect in the 
//profile/yhone bota then u can show the couple id ogether keza in the home show
// the memories i.e. in the previous app lay yalewn ena integrate that then 
// on memory clicked wede dirow app wisedew there's nth 2 loose.
