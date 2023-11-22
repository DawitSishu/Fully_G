import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String audioUrl;
  const PlayerPage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.audioUrl,
  }) : super(key: key);

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  bool isPlaying = false;
  late final AudioPlayer player;
  late final AssetSource path;

  Duration _duration = const Duration();
  Duration _position = const Duration();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    path = AssetSource(widget.audioUrl);
    player.setReleaseMode(ReleaseMode.loop);
    // set a callback for changing duration
    player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    // set a callback for position change
    player.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

    // set a callback for when audio ends
    player.onPlayerComplete.listen((_) {
      setState(() => _position = _duration);
    });
  }

  void playPause() async {
    if (isPlaying) {
      player.pause();
      isPlaying = false;
    } else {
      player.play(path);
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.title, // Replace with your title
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                widget.description,
                style: TextStyle(fontSize: 30),
              ),

              const SizedBox(height: 50), // Adjusted spacing

              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 4,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8),
                ),
                child: Slider(
                  value: _position.inSeconds.toDouble(),
                  onChanged: (value) async {
                    await player.seek(Duration(seconds: value.toInt()));
                    setState(() {});
                  },
                  min: 0,
                  max: _duration.inSeconds.toDouble(),
                  inactiveColor: Colors.white,
                  activeColor: Colors.red,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${(_position.inMinutes % 60).toString().padLeft(2, '0')}:${(_position.inSeconds % 60).toString().padLeft(2, '0')}",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                  Text(
                    "${(_duration.inMinutes % 60).toString().padLeft(2, '0')}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: playPause,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        blurRadius: 15,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 40,
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
