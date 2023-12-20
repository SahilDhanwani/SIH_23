import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:sih_23_audiometer/pages/righteartest.dart';
// ignore: unused_import
import '../utils/routes.dart';

class LeftEar extends StatefulWidget {
  const LeftEar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LeftEarState createState() => _LeftEarState();
}

class _LeftEarState extends State<LeftEar> {
  late double left250 = 80;
  late double left500 = 80;
  late double left1000 = 80;
  late double left2000 = 80;
  late double left4000 = 80;
  late double left8000 = 80;
  bool _isDisposed = false;
  late final List<double> leftValues;

  int i = 0;
  int j = 0;
  late final AudioPlayer player;
  late AssetSource path;
  int currentFrequency = 250;
  double currentVolume = 10;
  List<List<String>> tunes = [
    [
      'leftear/hearingTest.online.warble_250_10_L.mp3',
      'leftear/hearingTest.online.warble_250_20_L.mp3',
      'leftear/hearingTest.online.warble_250_30_L.mp3',
      'leftear/hearingTest.online.warble_250_40_L.mp3',
      'leftear/hearingTest.online.warble_250_50_L.mp3',
      'leftear/hearingTest.online.warble_250_60_L.mp3',
      'leftear/hearingTest.online.warble_250_70_L.mp3',
      'leftear/hearingTest.online.warble_250_80_L.mp3'
    ],
    [
      'leftear/hearingTest.online.warble_500_10_L.mp3',
      'leftear/hearingTest.online.warble_500_20_L.mp3',
      'leftear/hearingTest.online.warble_500_30_L.mp3',
      'leftear/hearingTest.online.warble_500_40_L.mp3',
      'leftear/hearingTest.online.warble_500_50_L.mp3',
      'leftear/hearingTest.online.warble_500_60_L.mp3',
      'leftear/hearingTest.online.warble_500_70_L.mp3',
      'leftear/hearingTest.online.warble_500_80_L.mp3'
    ],
    [
      'leftear/hearingTest.online.warble_1000_10_L.mp3',
      'leftear/hearingTest.online.warble_1000_20_L.mp3',
      'leftear/hearingTest.online.warble_1000_30_L.mp3',
      'leftear/hearingTest.online.warble_1000_40_L.mp3',
      'leftear/hearingTest.online.warble_1000_50_L.mp3',
      'leftear/hearingTest.online.warble_1000_60_L.mp3',
      'leftear/hearingTest.online.warble_1000_70_L.mp3',
      'leftear/hearingTest.online.warble_1000_80_L.mp3'
    ],
    [
      'leftear/hearingTest.online.warble_2000_10_L.mp3',
      'leftear/hearingTest.online.warble_2000_20_L.mp3',
      'leftear/hearingTest.online.warble_2000_30_L.mp3',
      'leftear/hearingTest.online.warble_2000_40_L.mp3',
      'leftear/hearingTest.online.warble_2000_50_L.mp3',
      'leftear/hearingTest.online.warble_2000_60_L.mp3',
      'leftear/hearingTest.online.warble_2000_70_L.mp3',
      'leftear/hearingTest.online.warble_2000_80_L.mp3'
    ],
    [
      'leftear/hearingTest.online.warble_4000_10_L.mp3',
      'leftear/hearingTest.online.warble_4000_20_L.mp3',
      'leftear/hearingTest.online.warble_4000_30_L.mp3',
      'leftear/hearingTest.online.warble_4000_40_L.mp3',
      'leftear/hearingTest.online.warble_4000_50_L.mp3',
      'leftear/hearingTest.online.warble_4000_60_L.mp3',
      'leftear/hearingTest.online.warble_4000_70_L.mp3',
      'leftear/hearingTest.online.warble_4000_80_L.mp3'
    ],
    [
      'leftear/hearingTest.online.warble_8000_10_L.mp3',
      'leftear/hearingTest.online.warble_8000_20_L.mp3',
      'leftear/hearingTest.online.warble_8000_30_L.mp3',
      'leftear/hearingTest.online.warble_8000_40_L.mp3',
      'leftear/hearingTest.online.warble_8000_50_L.mp3',
      'leftear/hearingTest.online.warble_8000_60_L.mp3',
      'leftear/hearingTest.online.warble_8000_70_L.mp3',
      'leftear/hearingTest.online.warble_8000_80_L.mp3'
    ],
  ];

  late bool _isPlayerInitialized;
  // ignore: unused_field
  late Future<void> _playerInitialization;

  @override
  void initState() {
    // Calibration
    initPlayer();
    super.initState();
    playTune();
  }

  Future<void> initPlayer() async {
    player = AudioPlayer();
    path = AssetSource(tunes[i][j]);
    _isPlayerInitialized = true;
    setState(() {});
    playTune();
  }

  @override
  void dispose() {
    _isDisposed = true; // Set the flag to true when disposing
    player.dispose();
    super.dispose();
  }

  void playTune() async {
    if (i < tunes.length && !_isDisposed && _isPlayerInitialized) {
      path = AssetSource(tunes[i][j]);
      player.setVolume(1);
      player.setBalance(-1.0);
      player.play(path);
      setState(() {}); // Check the flag before calling setState
    } else {
      if (!_isDisposed) {
        dispose();
        // setState(() {}); // Check the flag before calling setState
      }
    }
  }

  void pauseTune() async {
    if (!_isDisposed) {
      player.pause();
      setState(() {}); // Check the flag before calling setState
    }
  }

  void onTickButtonPressed() {
    setState(() {
      updateLeftValues();
      // If it reaches the last frequency (8000), navigate to MyRoutes.rightear
      if (i == tunes.length - 1) {
        onProceedButtonPressed();
        player.setBalance(0);
      } else {
        currentVolume = 10;
        j = 0;
        i = i + 1;
        currentFrequency = 2 * currentFrequency;
        pauseTune();
        playTune();
      }
    });
  }

  void updateLeftValues() {
    if (currentFrequency == 250) {
      left250 = currentVolume;
    }
    if (currentFrequency == 500) {
      left500 = currentVolume;
    }
    if (currentFrequency == 1000) {
      left1000 = currentVolume;
    }
    if (currentFrequency == 2000) {
      left2000 = currentVolume;
    }
    if (currentFrequency == 4000) {
      left4000 = currentVolume;
    }
    if (currentFrequency == 8000) {
      left8000 = currentVolume;
    }
  }

  void onCrossButtonPressed() {
    setState(() {
      if (j < tunes[i].length - 1) {
        j = j + 1;
        currentVolume = currentVolume + 10;
        pauseTune();
        playTune();
      } else {
        // If it reaches Volume 80 and Frequency 8000, move to MyRoutes.rightear
        if (currentVolume == 80 && currentFrequency == 8000) {
          onProceedButtonPressed();
        } else {
          // If it reaches Volume 80, move to the next frequency
          if (currentVolume == 80) {
            j = 0;
            currentVolume = 10;
            i = i + 1;
            currentFrequency = 2 * currentFrequency;
            pauseTune();
            playTune();
          } else {
            // Handle other cases if needed
          }
        }
      }
    });
  }

  void onProceedButtonPressed() {
    // Logic when the proceed button for the right ear is pressed
    Navigator.of(context).push(
      MaterialPageRoute(
        // Builder for the nextpage
        // class's constructor.

        // Date as arguments to
        // send to next page.
        builder: (context) => RightEar(
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
    // ignore: avoid_print
    print('Proceed');
    // You can navigate to the next screen or perform other actions here
    // ignore: avoid_print
    print('Proceeding to the right hear');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Test for Left Ear',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                'assets/images/leftear.png',
                height: MediaQuery.of(context).size.width * 0.3,
                width: MediaQuery.of(context).size.width * 0.3,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    'Frequency',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$currentFrequency Hz',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    'Volume',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '$currentVolume',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Can you hear?', style: TextStyle(fontSize: 30)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onCrossButtonPressed,
                  child: Image.asset(
                    'assets/images/notick.png',
                    height: MediaQuery.of(context).size.width *
                        0.15, // Adjusted size
                    width: MediaQuery.of(context).size.width *
                        0.15, // Adjusted size
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: onTickButtonPressed,
                  child: Image.asset(
                    'assets/images/yestick.png',
                    height: MediaQuery.of(context).size.width *
                        0.15, // Adjusted size
                    width: MediaQuery.of(context).size.width *
                        0.15, // Adjusted size
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // ElevatedButton(
            //     onPressed: () {
            //       // Navigator to the next page.
            //       onProceedButtonPressed();
            //     },
            //     child: const Text("Proceed For Right Ear Test "))
          ],
        ),
      ),
    );
  }
}
