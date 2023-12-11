import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class MyHomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentFrequency = 10;
  int currentVolume = 60;

  void playSound() {
    // Logic to play sound with the currentFrequency and currentVolume
    // ignore: avoid_print
    print(
        'Playing sound: Frequency - $currentFrequency, Volume - $currentVolume');
  }

  void onTickButtonPressed() {
    // Logic when the tick button is pressed
    if (currentVolume > 0) {
      currentVolume -= 10;
    } else {
      currentFrequency += 100;
      currentVolume = 100;
    }

    playSound();
  }

  void onCrossButtonPressed() {
    // Logic when the cross button is pressed
    currentFrequency += 100;
    currentVolume = 100;

    playSound();
  }

  void onProceedButtonPressed() {
    // Logic when the proceed button for the right ear is pressed
    // ignore: avoid_print
    print('Proceeding to the right ear');
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
            const Text(
              'Test for left ear',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Frequency: $currentFrequency'),
                Image.asset('assets/images/leftear.png', height: 50, width: 50),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Volume: $currentVolume'),
                const SizedBox(width: 16),
                // Box widget for volume control
                Container(
                  width: 50,
                  height: 30,
                  color: Colors.blue, // Customize the color or appearance
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Can you hear?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onCrossButtonPressed,
                  child: const Text('Cross'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: onTickButtonPressed,
                  child: const Text('Tick'),
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
