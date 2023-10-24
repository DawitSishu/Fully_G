import 'package:flutter/material.dart';

class AddMemory extends StatefulWidget {
  const AddMemory({super.key});

  @override
  State<AddMemory> createState() => _AddMemoryState();
}

class _AddMemoryState extends State<AddMemory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 40,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.favorite_sharp,
          size: 25,
          color: Colors.redAccent,
        ),
        title: Text(
          'ADD Memory',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Color.fromARGB(255, 116, 59, 107),
          ),
        ),
      ),
      // Icons.favorite
      body: Center(
        child: Text("Upload page"),
      ),
    );
  }
}
