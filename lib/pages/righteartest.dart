import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:sih_23_audiometer/pages/graph.dart';
import 'package:sih_23_audiometer/utils/errormessage.dart';
import 'package:sih_23_audiometer/utils/routes.dart';

class RightEar extends StatefulWidget {
  final List<double> leftValues;
  const RightEar({super.key, required this.leftValues});

  @override
  // ignore: library_private_types_in_public_api
  _RightEarState createState() => _RightEarState();
}

class _RightEarState extends State<RightEar> {
  late double right250 = 80;
  late double right500 = 80;
  late double right1000 = 80;
  late double right2000 = 80;
  late double right4000 = 80;
  late double right8000 = 80;
  late final List<double> rightValues;
  int i = 0;
  int j = 0;
  bool isPlaying = true;
  late final AudioPlayer player;
  late AssetSource path;
  int currentFrequency = 250;
  double currentVolume = 10;
  bool isButtonEnabled = false;
  List<List<String>> tunes = [
    [
      'rightear/hearingTest.online.warble_250_10_R.mp3',
      'rightear/hearingTest.online.warble_250_20_R.mp3',
      'rightear/hearingTest.online.warble_250_30_R.mp3',
      'rightear/hearingTest.online.warble_250_40_R.mp3',
      'rightear/hearingTest.online.warble_250_50_R.mp3',
      'rightear/hearingTest.online.warble_250_60_R.mp3',
      'rightear/hearingTest.online.warble_250_70_R.mp3',
      'rightear/hearingTest.online.warble_250_80_R.mp3'
    ],
    [
      'rightear/hearingTest.online.warble_500_10_R.mp3',
      'rightear/hearingTest.online.warble_500_20_R.mp3',
      'rightear/hearingTest.online.warble_500_30_R.mp3',
      'rightear/hearingTest.online.warble_500_40_R.mp3',
      'rightear/hearingTest.online.warble_500_50_R.mp3',
      'rightear/hearingTest.online.warble_500_60_R.mp3',
      'rightear/hearingTest.online.warble_500_70_R.mp3',
      'rightear/hearingTest.online.warble_500_80_R.mp3'
    ],
    [
      'rightear/hearingTest.online.warble_1000_10_R.mp3',
      'rightear/hearingTest.online.warble_1000_20_R.mp3',
      'rightear/hearingTest.online.warble_1000_30_R.mp3',
      'rightear/hearingTest.online.warble_1000_40_R.mp3',
      'rightear/hearingTest.online.warble_1000_50_R.mp3',
      'rightear/hearingTest.online.warble_1000_60_R.mp3',
      'rightear/hearingTest.online.warble_1000_70_R.mp3',
      'rightear/hearingTest.online.warble_1000_80_R.mp3'
    ],
    [
      'rightear/hearingTest.online.warble_2000_10_R.mp3',
      'rightear/hearingTest.online.warble_2000_20_R.mp3',
      'rightear/hearingTest.online.warble_2000_30_R.mp3',
      'rightear/hearingTest.online.warble_2000_40_R.mp3',
      'rightear/hearingTest.online.warble_2000_50_R.mp3',
      'rightear/hearingTest.online.warble_2000_60_R.mp3',
      'rightear/hearingTest.online.warble_2000_70_R.mp3',
      'rightear/hearingTest.online.warble_2000_80_R.mp3'
    ],
    [
      'rightear/hearingTest.online.warble_4000_10_R.mp3',
      'rightear/hearingTest.online.warble_4000_20_R.mp3',
      'rightear/hearingTest.online.warble_4000_30_R.mp3',
      'rightear/hearingTest.online.warble_4000_40_R.mp3',
      'rightear/hearingTest.online.warble_4000_50_R.mp3',
      'rightear/hearingTest.online.warble_4000_60_R.mp3',
      'rightear/hearingTest.online.warble_4000_70_R.mp3',
      'rightear/hearingTest.online.warble_4000_80_R.mp3'
    ],
    [
      'rightear/hearingTest.online.warble_8000_10_R.mp3',
      'rightear/hearingTest.online.warble_8000_20_R.mp3',
      'rightear/hearingTest.online.warble_8000_30_R.mp3',
      'rightear/hearingTest.online.warble_8000_40_R.mp3',
      'rightear/hearingTest.online.warble_8000_50_R.mp3',
      'rightear/hearingTest.online.warble_8000_60_R.mp3',
      'rightear/hearingTest.online.warble_8000_70_R.mp3',
      'rightear/hearingTest.online.warble_8000_80_R.mp3'
    ],
  ];

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
      player.setBalance(1.0);
      player.play(path);
      setState(() {});
    } else {
      dispose();
      setState(() {});
    }
  }

  void updaterightValues() {
    if (currentFrequency == 250) {
      right250 = currentVolume;
    }
    if (currentFrequency == 500) {
      right500 = currentVolume;
    }
    if (currentFrequency == 1000) {
      right1000 = currentVolume;
    }
    if (currentFrequency == 2000) {
      right2000 = currentVolume;
    }
    if (currentFrequency == 4000) {
      right4000 = currentVolume;
    }
    if (currentFrequency == 8000) {
      right8000 = currentVolume;
    }
  }

  void pauseTune() async {
    player.pause();
    setState(() {});
  }

  void onProceedButtonPressed() {
    // Logic when the proceed button for the right ear is pressed
    Navigator.pushNamed(context, MyRoutes.graph);
    // ignore: avoid_print
    print('Proceed');
    // You can navigate to the next screen or perform other actions here
    // ignore: avoid_print
    print('Proceeding to the audiogram');
  }

  void onTickButtonPressed() {
    setState(() {
      updaterightValues();
      // If it reaches the last frequency (8000), navigate to MyRoutes.rightear
      if (i == tunes.length - 1) {
        // onProceedButtonPressed();
        EM().toastMessage("Click on send button if you hear");
        //isButtonEnabled = true;
      } else {
        currentVolume = 10;
        j = 0;
        i = i + 1;
        currentFrequency = 2 * currentFrequency;
        pauseTune();
        playTune();
      }
      isButtonEnabled = currentFrequency == 8000;
      //  isButtonEnabled = false;
    });
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
          // onProceedButtonPressed();
          EM().toastMessage("Click on send button if you cannot hear");
          // isButtonEnabled = true;
        } else {
          // If it reaches Volume 80, move to the next frequency
          if (currentVolume == 80) {
            j = 0;
            currentVolume = 10;
            i = i + 1;
            currentFrequency = 2 * currentFrequency;
            pauseTune();
            playTune();
          }
          // Handle other cases if needed
        }
      }
      isButtonEnabled = currentFrequency == 8000;
    });
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
                'Test for Right Ear',
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
                'assets/images/rightear.png',
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
                    height: MediaQuery.of(context).size.width * 0.15,
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: onTickButtonPressed,
                  child: Image.asset(
                    'assets/images/yestick.png',
                    height: MediaQuery.of(context).size.width * 0.15,
                    width: MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
              ],
            ),
            Expanded(
                child: Container()), // Spacer to push buttons to the bottom
            ElevatedButton(
              onPressed: isButtonEnabled
                  ? () {
                      // Navigator to the next page.
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Graph(
                            leftValues: [
                              widget.leftValues[0],
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
                    }
                  : null,
              child: const Text("SEND"),
            ),
          ],
        ),
      ),
    );
  }
}
