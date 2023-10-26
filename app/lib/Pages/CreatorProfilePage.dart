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
      body: Stack(
        children: [
          // Background Image with Rounded Edges
          Container(
            height: 350, // Adjust the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/profile.png'), // Replace with your image
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
          ),
          Positioned(
            top: 200, // Adjust the top position for your content
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the profile page
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  // Profile Icon and Name
                  Row(
                    children: [
                      // Profile Icon (CircleAvatar)
                      CircleAvatar(
                        radius: 30, // Adjust the size as needed
                        backgroundColor: Color.fromARGB(
                            255, 116, 59, 107), // Background color of the icon
                        child: Icon(
                          Icons
                              .account_circle, // Replace with your desired icon
                          size: 60, // Adjust the size of the icon
                          color: Colors.white, // Color of the icon
                        ),
                      ),
                      SizedBox(width: 20),
                      // Profile Name and Bio
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Full Name",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Creating Memories Together"),
                        ],
                      ),
                    ],
                  ),

                  // Add more profile-related ListTile widgets
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//dave fix the error and this page mfr