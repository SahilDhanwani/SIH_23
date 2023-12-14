// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:audioplayers/audioplayers.dart';
import 'dart:async';
import 'package:noise_meter/noise_meter.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Calibration extends StatefulWidget {
  const Calibration({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalibrationState createState() => _CalibrationState();
}

class _CalibrationState extends State<Calibration> {
  bool isPlaying = false;
  NoiseReading? _latestReading;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  NoiseMeter? noiseMeter;
  late final AudioPlayer player;
  late final AssetSource path;

  Duration _duration = const Duration();
  // ignore: unused_field
  Duration _position = const Duration();

  @override
  void initState() {
    //Calibration
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    //Calibration + Background
    _noiseSubscription?.cancel();
    player.dispose();
    super.dispose();
  }

  void onError(Object error) {
    //Background
    // ignore: avoid_print
    print(error);
    stop();
  }

  Future<bool> checkPermission() async => //Background
      await Permission.microphone.isGranted;

  Future<void> requestPermission() async => //Background
      await Permission.microphone.request();

  void onData(NoiseReading noiseReading) => // Background
      setState(() => _latestReading = noiseReading);

  Future<void> start() async {
    //background

    // Create a noise meter, if not already done.
    noiseMeter ??= NoiseMeter();

    if (!(await checkPermission())) await requestPermission();

    // Listen to the noise stream.
    _noiseSubscription = noiseMeter?.noise.listen(onData, onError: onError);
    // setState(() => isPlaying = true);
  }

  void stop() {
    //Background
    _noiseSubscription?.cancel();
    setState(() => isPlaying = false);
  }

  Future initPlayer() async {
    player = AudioPlayer();
    path = AssetSource('audio/tone.mp3');

    // set a callback for changing duration
    player.onDurationChanged.listen((Duration d) {
      setState(
        () => _duration = d,
      );
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
      start();
      player.play(path);
      isPlaying = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 2),
                Image.asset(
                  'assets/images/abhi.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                const SizedBox(height: 20),
                // Use a Container to display the dynamic value inside a box
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${_latestReading?.meanDecibel.toStringAsFixed(2)} dB',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50),
                const Text('HEADSET').text.xl5.bold.make(),
                const Text('CALIBRATION').text.xl5.bold.make(),
                const SizedBox(height: 30),
                const Text("Play The Given Audio File ").text.xl2.bold.make(),
                const Text("And Adjust Your ").text.xl2.bold.make(),
                const Text("Phones Volume To 55 dB. ").text.xl2.bold.make(),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // InkWell(
                    //   onTap: () {
                    //     player.seek(Duration(seconds: _position.inSeconds - 10));
                    //     setState(() {});
                    //   },
                    //   child: Image.asset('assets/icons/rewind.png'),
                    // ),
                    // const SizedBox(width: 20),
                    InkWell(
                      onTap: playPause,
                      child: Icon(
                        isPlaying ? Icons.pause_circle : Icons.play_circle,
                        color: const Color.fromARGB(255, 30, 220, 208),
                        size: 100,
                      ),
                    ),
                    const SizedBox(width: 20),
 ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, MyRoutes.leftear); // Navigate to home screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    MyTheme.buttonColor, // Use the button color from theme
              ),
              child: const Text('Signup'),
            ),

                  ],
                ),
                
               
              ],
            )));
  }
}

