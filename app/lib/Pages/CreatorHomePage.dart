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

// class MemoryCard extends StatelessWidget {
//   final String title;
//   final String imageUrl;

//   MemoryCard({required this.title, required this.imageUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(0),
//       elevation: 5,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AspectRatio(
//             aspectRatio: 16 / 9,
//             child: ClipRRect(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12.0),
//                 topRight: Radius.circular(12.0),
//               ),
//               child: Image.asset(
//                 imageUrl,
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               title,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// MemoryCard(
//                       imageUrl: 'assets/images/3.jpg',
//                       date: 'ከበፊት እስካሁን',
//                       memoryText: 'መልዕክቴ ላንቺ',
//                     ),

// dave add the image of te headt and some design from the thing from the design
// and then add the cards and also make him change the text (poem) add templates