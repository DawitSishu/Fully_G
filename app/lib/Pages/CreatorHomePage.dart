import 'package:Yene/Pages/MemoryPage.dart';
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
        "Whether you need help with academic research, creative writing, general knowledge Whether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledgeWhether you need help with academic research, creative writing, general knowledge"
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
            title: const Text(
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
                      offset: const Offset(0, 4),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BeatingHeart(),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              //partner and paired up with
                              'Hand in hand, hearts aligned,Love\'s journey, beautifully designed',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              height: 1,
                              color: Colors.grey[300],
                              width: double.infinity,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'Embrace the beauty of love!',
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Colors.black54,
                                fontFamily: 'Open Sans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "My Memories",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 116, 59, 107),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: memories.length,
                itemBuilder: (context, index) {
                  final item = memories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MemoryPage(
                                    imageUrl: "${item["img"]}",
                                    title: "${item['title']}",
                                    description: "${item['description']}",
                                    audioUrl: "audios/message.mp3",
                                  )));
                    },
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
