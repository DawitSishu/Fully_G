import 'package:flutter/material.dart';

class CreatorProfile extends StatefulWidget {
  const CreatorProfile({super.key});

  @override
  State<CreatorProfile> createState() => _CreatorProfileState();
}

class _CreatorProfileState extends State<CreatorProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor:
                                      Color.fromARGB(255, 116, 59, 107),
                                  child: Icon(
                                    Icons.account_circle,
                                    size: 60,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Full Name",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                    ],
                                  ),
                                  Text("Creating Memories Together"),
                                ],
                              ),
                              Icon(Icons.edit, size: 20),
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(16.0),
                        //   child: Row(
                        //     children: [
                        //       Icon(Icons.person, size: 20),
                        //       SizedBox(width: 5),
                        //       Text("Nickname: JohnDoe"),
                        //       SizedBox(width: 20),
                        //       Icon(Icons.phone, size: 20),
                        //       SizedBox(width: 5),
                        //       Text("Phone: +1234567890"),
                        //       Spacer(),
                        //       Icon(Icons.edit, size: 20),
                        //     ],
                        //   ),
                        // ),
                        // Memory Cards with horizontal scroll
                        Text(
                          "My Memories",
                          style: TextStyle(
                            fontSize: 26, // Decreased font size
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 116, 59, 107),
                          ),
                        ),
                        MemoryCardGrid(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MemoryCardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // Change this to the number of memory cards you want
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 150,
              child: MemoryCard(
                title: "Memory $index",
                imageUrl: "assets/images/t${index + 1}.png",
              ),
            ),
          );
        },
      ),
    );
  }
}

class MemoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  MemoryCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0), // Remove margin
      elevation: 5,
      child: Column(
        children: [
          Image.asset(
            imageUrl,
            height: 100, // Decreased image height
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16, // Decreased font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
