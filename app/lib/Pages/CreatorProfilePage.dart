import 'package:Yene/services/PersonalServices.dart';
import 'package:Yene/util/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreatorProfile extends StatefulWidget {
  const CreatorProfile({super.key});

  @override
  State<CreatorProfile> createState() => _CreatorProfileState();
}

class _CreatorProfileState extends State<CreatorProfile> {
  Map<String, dynamic> data = {};
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    setState(() {
      isLoading = true;
    });
    final res = await getUserInfo();
    if (res['success'] == true) {
      data = res['data']['data'];
      setState(() {
        isLoading = false;
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: 400,
                    decoration: const BoxDecoration(
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
                    top: 300,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.fromLTRB(15.0, 0, 0, 15),
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
                              // SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${data['full_name']}",
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
                              IconButton(
                                icon: const Icon(Icons.edit,
                                    size: 35,
                                    color: Color.fromARGB(255, 116, 59, 107)),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return UpdateProfile(
                                          buttonText: "Update Your Profile",
                                          onProfileUpdated: fetchData);
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.person,
                                      color: Color.fromARGB(255, 116, 59, 107),
                                      size: 32,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "${data['nick_name']}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   children: <Widget>[
                                //     Icon(
                                //       Icons.favorite,
                                //       color: Colors.red,
                                //       size: 32,
                                //     ),
                                //     SizedBox(width: 10),
                                //     RichText(
                                //       text: TextSpan(
                                //         style: TextStyle(
                                //           fontSize: 20,
                                //           fontWeight: FontWeight.bold,
                                //           color: Colors
                                //               .black, // You can customize the text color
                                //         ),
                                //         children: <TextSpan>[
                                //           TextSpan(text: "My Love: "),
                                //           TextSpan(
                                //             text: "babe",
                                //             style: TextStyle(
                                //               color: Color.fromARGB(255, 116, 59,
                                //                   107), // Customize the text color
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     )
                                //   ],
                                // ),
                                const SizedBox(height: 10),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.phone,
                                      color: Color.fromARGB(255, 116, 59, 107),
                                      size: 32,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "${data['phone_number']}",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 32,
                                    ),
                                    const SizedBox(width: 10),
                                    RichText(
                                      text: TextSpan(
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors
                                              .black, // You can customize the text color
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(text: "Love ID: "),
                                          TextSpan(
                                            text: "${data['love_id']}",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 116, 59, 107)),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.show_chart,
                                  color: Color.fromARGB(255, 116, 59, 107),
                                  size: 32,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Love percentage",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                StatsCircularIndicator(percent: 75),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: InkWell(
          onTap: () async {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (data['partner_id'] == null)
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertForm(
                            buttonText: "Insert Partner's Love ID");
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: IconButton(
                          color: Colors.red,
                          padding: const EdgeInsets.all(0),
                          iconSize: 30,
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertForm(
                                    buttonText: "Insert Partner's Love ID");
                              },
                            );
                          },
                          icon: const FaIcon(
                            FontAwesomeIcons.heartCirclePlus,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        "ADD ID",
                        style: TextStyle(
                          fontSize: 18,
                          // fontWeight: FontWeight.bold,
                          // color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              GestureDetector(
                onTap: () {
                  print('logout');
                },
                child: Row(
                  children: [
                    IconButton(
                      color: const Color.fromARGB(255, 116, 59, 107),
                      padding: const EdgeInsets.all(0),
                      iconSize: 30,
                      alignment: Alignment.centerRight,
                      onPressed: () {},
                      icon: const Icon(Icons.logout_outlined),
                    ),
                    const Text('Log out'),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}

class StatsCircularIndicator extends StatelessWidget {
  final double percent;

  const StatsCircularIndicator({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            value: percent / 100,
            strokeWidth: 4,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(
              Color.fromARGB(255, 116, 59, 107),
            ),
          ),
        ),
        Text(
          '$percent%',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class AlertForm extends StatefulWidget {
  final String buttonText;

  const AlertForm({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  State<AlertForm> createState() => _AlertFormState();
}

class _AlertFormState extends State<AlertForm> {
  String data = '';

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content:
            const Text('Do you want to leave Inserting Partner\'s Love ID?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: contentBox(context),
      ),
    );
  }

  contentBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 116, 59, 107),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            widget.buttonText,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          InputBox(
            inputLabel: "Lover Id",
            placeHolder: "Enter your Partner's Love Id",
            update: (value) {
              data = value;
            },
            icon: const Icon(Icons.favorite),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              backgroundColor: const Color.fromARGB(255, 116, 59, 107),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            onPressed: () async {
              final response = await AddLoveId(data);
              if (response['success'] == true) {
                Navigator.of(context).pop();
                successSnackbar(context, text: response['data']['message']);
              } else {
                Navigator.of(context).pop();
                showSnackbar(context, text: response['data']['message']);
              }
            },
            child: const Text(
              'Submit',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UpdateProfile extends StatefulWidget {
  final String buttonText;
  final Function()? onProfileUpdated;

  const UpdateProfile({
    Key? key,
    required this.buttonText,
    this.onProfileUpdated,
  }) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  Map<String, dynamic> data = {};

  Future<bool> _onWillPop() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Do you want to leave without updating?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: contentBox(context),
      ),
    );
  }

  contentBox(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 116, 59, 107),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.buttonText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            InputBox(
              inputLabel: "Full Name",
              placeHolder: "Enter your Full Name",
              update: (value) {
                data['full_name'] = value;
              },
              icon: const Icon(Icons.person),
            ),
            const SizedBox(height: 20),
            InputBox(
              inputLabel: "Nick Name",
              placeHolder: "Enter your Nick Name",
              update: (value) {
                data['nick_name'] = value;
              },
              icon: const Icon(Icons.person_2_rounded),
            ),
            const SizedBox(height: 20),
            InputBox(
              inputLabel: "Phone Number",
              placeHolder: "Enter your Phone Number",
              isPhone: true,
              update: (value) {
                if (value.startsWith('0')) {
                  data['phone'] = '+251${value.substring(1)}';
                } else if (value.startsWith('2')) {
                  data['phone'] = '+$value';
                } else if (value.startsWith('+2')) {
                  data['phone'] = value;
                } else {
                  data['phone'] = '';
                }
              },
              icon: const Icon(Icons.phone),
            ),
            const SizedBox(height: 20),
            InputBox(
              inputLabel: "Password",
              placeHolder: "Enter your new Password",
              update: (value) {
                data['password'] = value;
              },
              icon: const Icon(Icons.lock),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                backgroundColor: const Color.fromARGB(255, 116, 59, 107),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              onPressed: () async {
                final response = await UpdatePro(data);
                if (response['success'] == true) {
                  Navigator.of(context).pop();
                  successSnackbar(context, text: response['data']['message']);
                  if (widget.onProfileUpdated != null) {
                    widget.onProfileUpdated!(); // Call the callback function
                  }
                } else {
                  Navigator.of(context).pop();
                  showSnackbar(context, text: response['data']['message']);
                }
              },
              child: const Text(
                'Update',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
