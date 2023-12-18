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
    initialRoute: 'login',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const OnboardingScreen(),
      'login': (context) => const LoginPage(),
      'signup': (context) => const SignUpPage(),
      'uploadMemory': (context) => const AddMemory(),
      'main': (context) => const CreatorMainPage(),
      'payment': (context) => const PaymentPage(),
    },
  ));
}


// u can show the couple id ogether
