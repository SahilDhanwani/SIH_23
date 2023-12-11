import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Local Audio Player'),
        ),
        body: AudioPlayerWidget(),
      ),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  AudioPlayer audioPlayer;
  String audioPath = "assets/audio/calibration.mp3"; // Adjust the path accordingly
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  void playPause() {
    if (isPlaying) {
      audioPlayer.pause();
    } else {
      playAudio();
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void stop() {
    audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  Future<void> playAudio() async {
    try {
      await audioPlayer.play(audioPath as Source, isLocal: true);
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: playPause,
            child: Text(isPlaying ? 'Pause Calibration' : 'Start Calibration'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: stop,
            child: Text('Stop Calibration'),
          ),
        ],
      ),
    );
  }
}
