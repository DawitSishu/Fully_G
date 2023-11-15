import 'package:Yene/Pages/AddMemoryPage.dart';
import 'package:Yene/Pages/CreatorMainPage.dart';
import 'package:Yene/Pages/LoginPage.dart';
import 'package:Yene/Pages/OnboardingPage.dart';
import 'package:Yene/Pages/PaymentPage.dart';
import 'package:Yene/Pages/SIgnUpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// #e12cc7
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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


// u can show the couple id ogether
// on memory clicked wede dirow app wisedew there's nth 2 loose.
