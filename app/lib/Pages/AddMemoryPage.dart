import 'dart:async';
import 'dart:io';

import 'package:Yene/services/UploaderServices.dart';
import 'package:Yene/util/widgets.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class AddMemory extends StatefulWidget {
  const AddMemory({super.key});

  @override
  State<AddMemory> createState() => _AddMemoryState();
}

class _AddMemoryState extends State<AddMemory> {
  PlatformFile? img;
  String imgName = '';
  PlatformFile? aud;
  String audName = '';
  Map<dynamic, dynamic> data = {};
  final recorder = FlutterSoundRecorder();
  bool ready = false;
  bool isRecording = false;

  DateTime? startTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initRecorder();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    recorder.closeRecorder();
    super.dispose();
  }

  Future initRecorder() async {
    //not added permission for ios
    final status = await Permission.microphone.request();

    if (status != PermissionStatus.granted) {
      showSnackbar(context, text: "Microphone permission not granted!!");
      return;
    }

    await recorder.openRecorder();
    ready = true;
    // await recorder.startRecorder();
    recorder.setSubscriptionDuration(const Duration(microseconds: 500));
  }

  // Future stop() async {
  //   if (!ready) return;
  //   final path = await recorder.stopRecorder();
  //   final audioFile = File(path!); // here na ezi
  //   print("audio: $audioFile ");
  // }
  final AudioPlayer _audioPlayer = AudioPlayer();
  Future<File?> stop() async {
    if (!ready) return null;

    final path = await recorder.stopRecorder();
    if (path == null) return null;

    final audioFile = File(path);
    print("audio: $audioFile ");

    return audioFile;
  }

  Future record() async {
    if (!ready) return;
    await recorder.startRecorder(toFile: 'audio');
  }

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
            onTap: () async {
              final result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['jpg', 'jpeg'],
              );
              if (result != null) {
                img = result.files.first;
                int maxSizeInBytes = 5 * 1024 * 1024;
                if (img!.size! <= maxSizeInBytes) {
                  setState(() {
                    imgName = img!.name;
                  });
                } else {
                  showSnackbar(context,
                      text: "File size exceeds the limit of 5 MB");
                  setState(() {
                    imgName = '';
                  });
                }
              } else {
                setState(() {
                  imgName = '';
                });
                return;
              }
            },
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
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      imgName.isEmpty ? "Select Image" : imgName,
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
          InputBox(
            inputLabel: '',
            icon: const Icon(Icons.title),
            placeHolder: 'Add Gift Title',
            update: (value) {
              data['title'] = value;
            },
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
          InputBox(
            inputLabel: '',
            icon: const Icon(Icons.description),
            placeHolder: 'Add Gift Description',
            update: (value) {
              data['description'] = value;
            },
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
                        width: 2, color: Color.fromRGBO(239, 239, 239, 1)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.grey.shade100,
                  ),
                  onPressed: () async {
                    if (recorder.isRecording) {
                      File? audioFile = await stop();
                      if (audioFile != null) {
                        setState(() {
                          aud = PlatformFile(
                            name: 'Audio.mp3', // Change the name as needed
                            size: audioFile.lengthSync(),
                            path: audioFile.path,
                          );
                          audName = 'Audio.mp3'; // Update the name as needed
                        });
                        successSnackbar(context, text: "Audio Recorded!!");
                      }
                    } else {
                      await record();
                    }
                    setState(() {
                      isRecording = !isRecording;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          isRecording ? Icons.stop : Icons.mic,
                          size: 48, // Adjust the size as needed
                          color: Color.fromARGB(
                              255, 100, 58, 97), // Adjust the color as needed
                        ),
                        Text(
                          isRecording ? 'Stop Recording' : 'Record Audio',
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
                        // StreamBuilder<bool>(
                        //     stream: Stream.periodic(
                        //         Duration(seconds: 1), (_) => isRecording),
                        //     builder: (context, snapshot) {
                        //       final bool recording = snapshot.data ?? false;

                        //       if (recording && startTime != null) {
                        //         final duration =
                        //             DateTime.now().difference(startTime!);
                        //         int minutes = duration.inMinutes;
                        //         int seconds = duration.inSeconds % 60;

                        //         String minutesStr =
                        //             minutes < 10 ? '0$minutes' : '$minutes';
                        //         String secondsStr =
                        //             seconds < 10 ? '0$seconds' : '$seconds';
                        //         return Text('$minutesStr:$secondsStr');
                        //       } else {
                        //         return Text('00:00');
                        //       }
                        //     }),
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
                          width: 2, color: Color.fromRGBO(239, 239, 239, 1)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.grey.shade100),
                  onPressed: () async {
                    final result = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['mp3', 'wav', 'ogg', 'aac'],
                    );

                    if (result != null) {
                      aud = result.files.first;
                      int maxSizeInBytes = 10 * 1024 * 1024;
                      if (aud!.size! <= maxSizeInBytes) {
                        setState(() {
                          audName = aud!.name;
                        });
                      } else {
                        showSnackbar(context,
                            text: "File size exceeds the limit of 10 MB");
                        setState(() {
                          audName = '';
                        });
                      }
                    } else {
                      setState(() {
                        audName = '';
                      });
                      return;
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Column(children: [
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
                        audName.isEmpty ? 'Upload Audio' : audName,
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
                onPressed: () async {
                  final res = await uploadImageAndAudio(
                    imageFile: File(img!.path!),
                    imageName: imgName,
                    audioFile: File(aud!.path!),
                    audioName: audName,
                  );
                  final res2 = await createGift(data);
                  print("res $res");
                  print("res2 $res2");
                  if (res['success'] == true && res2['success'] == true) {
                    successSnackbar(context, text: res2['data']['message']);
                  } else {
                    showSnackbar(context, text: res2['data']['message']);
                  }
                },
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
