import 'package:app/Pages/AddMemoryPage.dart';
import 'package:app/Pages/CreatorHomePage.dart';
import 'package:flutter/material.dart';

class CreatorMainPage extends StatefulWidget {
  const CreatorMainPage({super.key});

  @override
  State<CreatorMainPage> createState() => _CreatorMainPageState();
}

class _CreatorMainPageState extends State<CreatorMainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Tab> myTabs = <Tab>[
    const Tab(
      icon: Icon(
        Icons.grid_on,
        size: 27,
      ),
      child: Text(
        'Home',
        maxLines: 1,
        softWrap: false,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    ),
    const Tab(
      icon: Icon(
        Icons.favorite_sharp,
        size: 27,
      ),
      child: Text(
        'Add Memory',
        maxLines: 1,
        softWrap: false,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    ),
    const Tab(
      icon: Icon(
        Icons.person,
        size: 27,
      ),
      child: Text(
        'Profile',
        maxLines: 1,
        softWrap: false,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: tabController,
          children: [HomePage(), AddMemory(), temp()],
        ),
        bottomNavigationBar: DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
                    width: 1.2, color: Color.fromARGB(255, 116, 59, 107))),
          ),
          child: TabBar(
            labelPadding: EdgeInsets.zero,
            controller: tabController,
            splashBorderRadius: BorderRadius.circular(40),
            labelColor: Color.fromARGB(255, 116, 59, 107),
            unselectedLabelColor: Colors.grey,
            unselectedLabelStyle: const TextStyle(),
            tabs: myTabs,
          ),
        ),
      );
}

class temp extends StatelessWidget {
  const temp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Center(
        child: Text(
          'Hello, profile!',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
