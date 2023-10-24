import 'package:app/util/widgets.dart';
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
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        children: [
          SizedBox(
            height: 20,
          ),
          InkWell(
            // borderRadius: BorderRadius.circular(5),
            onTap: () async {},
            child: Container(
              // color: Colors.grey,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.grey.shade300,
                ),
                color: Colors.grey.shade100,
              ),
              height: 190,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset('assets/images/ImportPdf.png'),

                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo_sharp),
                    color: Color.fromARGB(255, 116, 59, 107),
                    iconSize: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Select Image",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Add Title',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Add Description',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
                onPressed: () async {},
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
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
