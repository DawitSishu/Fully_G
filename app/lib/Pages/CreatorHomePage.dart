import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 3,
          title: Text(
            'Welcome Nick_Name',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24,
              color: Color.fromARGB(255, 116, 59, 107),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text('hey dave'),
      ),
    );
  }
}
