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
        body: Column(
          children: [
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
            Container(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    3, // Change this to the number of memory cards you want
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
            ),
          ],
        ));
  }
}

class MemoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  MemoryCard({required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9, // Adjust the aspect ratio as needed
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0),
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// dave add the image of te headt and some design from the thing from the design
// and then add the cards and also make him change the text (poem) add templates