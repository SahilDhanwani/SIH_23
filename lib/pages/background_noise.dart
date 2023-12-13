import 'dart:async';
import 'package:noise_meter/noise_meter.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sih_23_audiometer/utils/routes.dart';

class BackgroundNoise extends StatefulWidget {
  const BackgroundNoise({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BackgroundNoiseState createState() => _BackgroundNoiseState();
}

class _BackgroundNoiseState extends State<BackgroundNoise> {
  bool _isRecording = false;
  NoiseReading? _latestReading;
  StreamSubscription<NoiseReading>? _noiseSubscription;
  NoiseMeter? noiseMeter;

  @override
  void dispose() {
    _noiseSubscription?.cancel();
    super.dispose();
  }

  void onData(NoiseReading noiseReading) {
    setState(() {
      _latestReading = noiseReading;
    });
  }

  void onError(Object error) {
    // ignore: avoid_print
    print(error);
    stop();
  }

  Future<bool> checkPermission() async => await Permission.microphone.isGranted;

  Future<void> requestPermission() async =>
      await Permission.microphone.request();

  Future<void> start() async {
    noiseMeter ??= NoiseMeter();

    if (!(await checkPermission())) await requestPermission();

    _noiseSubscription = noiseMeter?.noise.listen(onData, onError: onError);
    setState(() {
      _isRecording = true;
    });
  }

  void stop() {
    _noiseSubscription?.cancel();
    setState(() {
      _isRecording = false;
    });
  }

  bool isNoiseBelowThreshold() {
    return _latestReading?.meanDecibel != null &&
        _latestReading!.meanDecibel < 40;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          _isRecording ? "Mic: ON" : "Mic: OFF",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Noise: ${_latestReading?.meanDecibel.toStringAsFixed(2)} dB',
                        ),
                      ),
                      Text(
                        'Max: ${_latestReading?.maxDecibel.toStringAsFixed(2)} dB',
                      ),
                      ElevatedButton(
                        onPressed: isNoiseBelowThreshold()
                            ? () {
                                Navigator.pushNamed(context, MyRoutes.headset);
                              }
                            : null,
                        child: const Text('Proceed'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: _isRecording ? Colors.red : Colors.green,
            onPressed: _isRecording ? stop : start,
            child:
                _isRecording ? const Icon(Icons.stop) : const Icon(Icons.mic),
          ),
        ),
      );
}
