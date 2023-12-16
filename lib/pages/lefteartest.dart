import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:sih_23_audiometer/pages/righteartest.dart';
import '../utils/routes.dart';

class LeftEar extends StatefulWidget {
  const LeftEar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LeftEar> {
  late double left250 = 10;
  late double left500 = 10;
  late double left1000 = 10;
  late double left2000 = 10;
  late double left4000 = 10;
  late double left8000 = 10;
  late final List<double> leftValues;

  int i = 0;
  int j = 0;
  bool isPlaying = true;
  late final AudioPlayer player;
  late AssetSource path;
  int currentFrequency = 250;
  int currentVolume = 10;
  List<List<String>> tunes = [
    [
      'leftear/hearingTest.online.warble_250_10_L.mp3','leftear/hearingTest.online.warble_250_20_L.mp3',
      'leftear/hearingTest.online.warble_250_30_L.mp3','leftear/hearingTest.online.warble_250_40_L.mp3',
      'leftear/hearingTest.online.warble_250_50_L.mp3','leftear/hearingTest.online.warble_250_60_L.mp3',
      'leftear/hearingTest.online.warble_250_70_L.mp3','leftear/hearingTest.online.warble_250_80_L.mp3'],
    [
      'leftear/hearingTest.online.warble_500_10_L.mp3','leftear/hearingTest.online.warble_500_20_L.mp3',
      'leftear/hearingTest.online.warble_500_30_L.mp3','leftear/hearingTest.online.warble_500_40_L.mp3',
      'leftear/hearingTest.online.warble_500_50_L.mp3','leftear/hearingTest.online.warble_500_60_L.mp3',
      'leftear/hearingTest.online.warble_500_70_L.mp3','leftear/hearingTest.online.warble_500_80_L.mp3'],
    [
      'leftear/hearingTest.online.warble_1000_10_L.mp3','leftear/hearingTest.online.warble_1000_20_L.mp3',
      'leftear/hearingTest.online.warble_1000_30_L.mp3','leftear/hearingTest.online.warble_1000_40_L.mp3',
      'leftear/hearingTest.online.warble_1000_50_L.mp3','leftear/hearingTest.online.warble_1000_60_L.mp3',
      'leftear/hearingTest.online.warble_1000_70_L.mp3','leftear/hearingTest.online.warble_1000_80_L.mp3'],
    [
      'leftear/hearingTest.online.warble_2000_10_L.mp3','leftear/hearingTest.online.warble_2000_20_L.mp3',
      'leftear/hearingTest.online.warble_2000_30_L.mp3','leftear/hearingTest.online.warble_2000_40_L.mp3',
      'leftear/hearingTest.online.warble_2000_50_L.mp3','leftear/hearingTest.online.warble_2000_60_L.mp3',
      'leftear/hearingTest.online.warble_2000_70_L.mp3','leftear/hearingTest.online.warble_2000_80_L.mp3'],
    [
      'leftear/hearingTest.online.warble_4000_10_L.mp3','leftear/hearingTest.online.warble_4000_20_L.mp3',
      'leftear/hearingTest.online.warble_4000_30_L.mp3','leftear/hearingTest.online.warble_4000_40_L.mp3',
      'leftear/hearingTest.online.warble_4000_50_L.mp3','leftear/hearingTest.online.warble_4000_60_L.mp3',
      'leftear/hearingTest.online.warble_4000_70_L.mp3','leftear/hearingTest.online.warble_4000_80_L.mp3'],
    [
      'leftear/hearingTest.online.warble_8000_10_L.mp3','leftear/hearingTest.online.warble_8000_20_L.mp3',
      'leftear/hearingTest.online.warble_8000_30_L.mp3','leftear/hearingTest.online.warble_8000_40_L.mp3',
      'leftear/hearingTest.online.warble_8000_50_L.mp3','leftear/hearingTest.online.warble_8000_60_L.mp3',
      'leftear/hearingTest.online.warble_8000_70_L.mp3','leftear/hearingTest.online.warble_8000_80_L.mp3'],
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
    path = AssetSource(tunes[i][j]);
    setState(() {});
    playTune();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void playTune() async {
    if (i < tunes.length) {
      path = AssetSource(tunes[i][j]);
      player.setVolume(1);
      player.setBalance(-1.0);
      player.play(path);
      setState(() {});
    } else {
      dispose();
      setState(() {});
    }
  }

  void pauseTune() async {
    player.pause();
    setState(() {});
  }

  void onTickButtonPressed() {
    setState(() {
      currentVolume = 10;
      j = 0;
      i = i + 1;
      currentFrequency = 2 * currentFrequency;
      pauseTune();
      playTune();
    });
  }

  void onCrossButtonPressed() {
    setState(() {
      j = j + 1;
      currentVolume = currentVolume + 10;
      pauseTune();
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
        title: const Text('Left Ear Test'),
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
                Image.asset('assets/images/leftear.png', height: 50, width: 50),
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
                      builder: (context) =>  RightEar(
                        leftValues: [
                          left250,
                          left500,
                          left1000,
                          left2000,
                          left4000,
                          left8000
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
