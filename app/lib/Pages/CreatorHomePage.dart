import 'package:Yene/util/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final memories = [
  {
    "title": "some title",
    "img": "assets/images/t1.png",
    "description":
        "Whether you need help with academic research, creative writing, general knowledge"
  },
  {
    "title": "other title",
    "img": "assets/images/t2.png",
    "description": "Whether you need help with"
  },
  {
    "title": "another title",
    "img": "assets/images/t3.png",
    "description": "some description"
  },
];

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(0, 4), // Adjusted offset for bottom shadow
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: BeatingHeart(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Top Text',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Bottom Text',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 10,
              ),
              Text(
                "My Memories",
                style: TextStyle(
                  fontSize: 26, // Decreased font size
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 116, 59, 107),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Set the number of cards in each row
                  mainAxisSpacing:
                      8.0, // Set the vertical spacing between cards
                  crossAxisSpacing:
                      8.0, // Set the horizontal spacing between cards
                ),
                physics: NeverScrollableScrollPhysics(), // Disable scrolling
                shrinkWrap: true,
                itemCount: memories.length,
                itemBuilder: (context, index) {
                  final item = memories[index];
                  return GestureDetector(
                    onTap: () {},
                    child: MemoryCard(
                      memoryText: item['title'],
                      imageUrl: item["img"],
                      desc: item['description'],
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}


// dave add some design from the thing from the design
// and also make him change the text (poem) add templates