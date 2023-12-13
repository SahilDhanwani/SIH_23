// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

class LeftEar extends StatefulWidget {
  const LeftEar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LeftEarState createState() => _LeftEarState();
}

class _LeftEarState extends State<LeftEar> {
  static const MethodChannel _volumeChannel =
      MethodChannel('com.example.volume_control');
  int currentFrequency = 250;
  int currentVolume = 10;

  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _isPlaying = false;
      });
    });
  }

  Future<void> playSound() async {
    String audioFileName = '$currentFrequency.mp3';
    String audioFilePath = 'assets/audios/$audioFileName';

    await _audioPlayer.play(audioFilePath, isLocal: true);
    setState(() {
      _isPlaying = true;
    });
  }

  Future<void> adjustVolume(int change) async {
    try {
      await _volumeChannel.invokeMethod('adjustVolume', {'change': change});
    } catch (e) {
      // ignore: avoid_print
      print('Failed to adjust volume: $e');
    }
  }

  void onTickButtonPressed() {
    setState(() {
      currentVolume = 10;
      currentFrequency = 2 * currentFrequency;
    });

    playSound();
  }

  void onCrossButtonPressed() {
    setState(() {
      if (currentVolume < 90) {
        currentVolume += 10;
        adjustVolume(10); // Adjust volume by 10
      } else {
        currentFrequency = 2 * currentFrequency;
        currentVolume = 10;
      }
    });

    playSound();
  }

  void onProceedButtonPressed() {
    // ignore: avoid_print
    print('Proceeding to the right ear');
    // Logic when the proceed button for the right ear is pressed
    // You can navigate to the next screen or perform other actions here
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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
                Image.asset('assets\\images\\leftear.png',
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
              child: Container(),
            ), // Spacer to push buttons to the bottom
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: onProceedButtonPressed,
                child: const Text('Proceed for right ear'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
