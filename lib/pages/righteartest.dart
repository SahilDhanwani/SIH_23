import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import '../utils/routes.dart';

class RightEar extends StatefulWidget {
  const RightEar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RightEar> {
  int i = 0;
  double j = 0.1;
  bool isPlaying = true;
  late final AudioPlayer player;
  late AssetSource path;
  int currentFrequency = 250;
  int currentVolume = 10;
  List<String> tunes = [
    'audio/250hz.mp3',
    'audio/500hz.mp3',
    'audio/1000hz.mp3',
    'audio/2000hz.mp3',
    'audio/4000hz.mp3',
    'audio/8000hz.mp3'
  ];

  @override
  void initState() {
    //Calibration
    initPlayer();
    super.initState();
    playTune();
  }

  Future<void> initPlayer() async {
    player = AudioPlayer();
    path = AssetSource(tunes[i]);
  }

  @override
  void dispose() {
    //Calibration
    player.dispose();
    super.dispose();
  }

  void playTune() async {
    // Check if there are more tunes to play
    if (i < tunes.length) {
      path = AssetSource(tunes[i]);
      player.setVolume(j);
      player.play(path);
      setState(() {});
    } else {
      // All tunes played, you can handle this case accordingly
      // For now, let's reset to the first tune
      i = 0;
      path = AssetSource(tunes[i]);
      player.setVolume(j);
      player.play(path);
      setState(() {});
    }
  }

  void stopTune() async {
    player.pause();
    setState(() {});
  }

  void onTickButtonPressed() {
    setState(() {
      currentVolume = 10;
      j = 0.1;
      i = i + 1;
      currentFrequency = 2 * currentFrequency;
      stopTune();
      playTune();
    });
  }

  void onCrossButtonPressed() {
    setState(() {
      j = j + 0.1;
      stopTune();
      playTune();
    });
  }

  void onProceedButtonPressed() {
    // Logic when the proceed button for the right ear is pressed
    Navigator.pushNamed(context, MyRoutes.rightear);
    // ignore: avoid_print
    print('Proceed');
    // You can navigate to the next screen or perform other actions here
    // ignore: avoid_print
    print('Proceeding to the right ear');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Right Ear Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Test for left ear',
                ),
                Image.asset('assets/images/rightear.png',
                    height: 50, width: 50),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Frequency: $currentFrequency'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Volume: $currentVolume'),
                const SizedBox(width: 16),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Can you hear?')],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onCrossButtonPressed,
                  child: const Text('No'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: onTickButtonPressed,
                  child: const Text('Yes'),
                ),
              ],
            ),
            Expanded(
                child: Container()), // Spacer to push buttons to the bottom
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: onProceedButtonPressed,
                child: const Text('Proceed'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
