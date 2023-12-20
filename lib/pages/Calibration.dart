import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:noise_meter/noise_meter.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sih_23_audiometer/pages/headset.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Calibration extends StatefulWidget {
  const Calibration({Key? key});

  @override
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
  Duration _position = const Duration();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _noiseSubscription?.cancel();
    player.dispose();
    super.dispose();
  }

  void onError(Object error) {
    print(error);
    stop();
  }

  Future<bool> checkPermission() async => await Permission.microphone.isGranted;

  Future<void> requestPermission() async => await Permission.microphone.request();

  void onData(NoiseReading noiseReading) => setState(() => _latestReading = noiseReading);

  Future<void> start() async {
    noiseMeter ??= NoiseMeter();

    if (!(await checkPermission())) await requestPermission();

    _noiseSubscription = noiseMeter?.noise.listen(onData, onError: onError);
  }

  void stop() {
    _noiseSubscription?.cancel();
    setState(() => isPlaying = false);
  }

  Future<void> initPlayer() async {
    player = AudioPlayer();
    path = AssetSource('audio/tone.mp3');

    player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
    });

    player.onPositionChanged.listen((Duration p) {
      setState(() => _position = p);
    });

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
      body: Stack(
        children: [
          // Background Image
           Image.asset(
                  'assets/images/bluebackground.png', // Replace with your image path
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
          Padding(
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
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${_latestReading?.meanDecibel.toStringAsFixed(2)} dB',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 50),
                const Text('HEADSET').text.xl5.bold.make(),
                const Text('CALIBRATION').text.xl5.bold.make(),
                const SizedBox(height: 30),
                const Text("Play The Given Audio File ").text.xl2.bold.make(),
                const Text("And Adjust  ").text.xl2.bold.make(),
                const Text(" Volume Between 80 to 85 dB. ").text.xl2.bold.make(),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Headset())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyTheme.buttonColor,
                      ),
                      child: const Text('Proceed'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
