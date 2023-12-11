import 'package:flutter/material.dart';

class AddMemory extends StatefulWidget {
  const AddMemory({super.key});

  @override
  State<AddMemory> createState() => _AddMemoryState();
}

class _AddMemoryState extends State<AddMemory> {
  @override
  Widget build(BuildContext context) {
    final cardWidth = (MediaQuery.of(context).size.width - 40) / 2 - 10;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 40,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.card_giftcard_sharp,
          size: 25,
          color: Colors.redAccent,
        ),
        title: const Text(
          'ADD Gift',
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
          const SizedBox(
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
                    color: const Color.fromARGB(255, 116, 59, 107),
                    iconSize: 50,
                  ),
                  const Padding(
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
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Add Title',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Add Description',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: cardWidth,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        width: 2,
                        color: Color.fromRGBO(239, 239, 239, 1)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.grey.shade100,
                  ),
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.mic,
                          size: 48, // Adjust the size as needed
                          color: Color.fromARGB(
                              255, 100, 58, 97), // Adjust the color as needed
                        ),
                        Text(
                          'Record Audio',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: false,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            height: 1.1,
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: cardWidth,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                          width: 2,
                          color: Color.fromRGBO(239, 239, 239, 1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.grey.shade100),
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: const Column(children: [
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.cloud_upload,
                        size: 48, // Adjust the size as needed
                        color: Color.fromARGB(
                            255, 100, 58, 97), // Adjust the color as needed
                      ),
                      Text(
                        'Upload Audio',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          height: 1,
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
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
                      maxWidth: 250,
                    ),
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
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
