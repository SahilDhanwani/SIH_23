// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:sih_23_audiometer/pages/graph.dart';
import '../utils/routes.dart';

class RightEar extends StatefulWidget {
  final List<double> leftValues; 
 const RightEar({super.key, required this.leftValues});


  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RightEar> {



  late double right250 = 60.0;
  late double right500 = 50;
  late double right1000 = 40;
  late double right2000 = 30;
  late double right4000 = 20;
  late double right8000 = 10;
  late final List<double> rightValues;
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
      player.setBalance(1.0);
      player.play(path);
      setState(() {});
    } else {
      // All tunes played, you can handle this case accordingly
      // For now, let's reset to the first tune
      i = 0;
      path = AssetSource(tunes[i]);
      player.setVolume(j);
      player.setBalance(1.0);
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
             ElevatedButton(
                onPressed: () {
                  // Navigator to the next page.
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      // Builder for the nextpage
                      // class's constructor.

                      // Date as arguments to
                      // send to next page.
                      builder: (context) =>  Graph(
                        leftValues: [
                          widget.leftValues[0] ,
                         widget.leftValues[1],
                          widget.leftValues[2],
                          widget.leftValues[3],
                          widget.leftValues[4],
                          widget.leftValues[5]
                        ],
                        rightValues: [
                           right250,
                           right500,
                           right1000,
                           right2000,
                           right4000,
                           right8000
                        ],
                      ),
                    ),
                  );
                },
                child: const Text("SEND"))
          ],
        ),
      ),
    );
  }
}
