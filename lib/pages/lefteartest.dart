import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors

// ignore: use_key_in_widget_constructors
class LefttEar extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LefttEar> {
  int currentFrequency = 250;
  int currentVolume = 10;

  void playSound() {
    // Logic to play sound with the currentFrequency and currentVolume
    // ignore: avoid_print
    print(
        'Playing sound: Frequency - $currentFrequency, Volume - $currentVolume');
  }

  void onTickButtonPressed() {
    setState(() {
      currentVolume = 10;
      currentFrequency = 2 * currentFrequency;
    });
    // Logic when the tick button is pressed
    // if (currentVolume > 0) {
    //currentVolume = 10;
    // } else {
    //currentFrequency = 2 * currentFrequency;
    //  currentVolume = 100;
    //}

    playSound();
  }

  void onCrossButtonPressed() {
    setState(() {
      if (currentVolume < 90) {
        currentVolume += 10;
      } else {
        currentFrequency = 2 * currentFrequency;
        currentVolume = 10;
      }
    });

    // if (currentVolume < 90) {
    //   currentVolume += 10;
    // } else {
    //   currentFrequency = 2 * currentFrequency;
    //   currentVolume = 10;
    // }

    playSound();
    // Logic when the cross button is pressed
    //currentFrequency += 100;
    //currentVolume = 100;

    //playSound();
  }

  void onProceedButtonPressed() {
    // Logic when the proceed button for the right ear is pressed
    // ignore: avoid_print
    print('Proceed');
    // You can navigate to the next screen or perform other actions here
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
                child: Container()), // Spacer to push buttons to the bottom
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
