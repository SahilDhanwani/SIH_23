import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Calibration extends StatefulWidget {
  const Calibration({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalibrationState createState() => _CalibrationState();

}

class _CalibrationState extends State<Calibration> {

  bool isPlaying = false;
  late final AudioPlayer player;
  late final AssetSource path;

  Duration _duration = const Duration();
  // ignore: unused_field
  Duration _position = const Duration();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future initPlayer() async {
    player = AudioPlayer();
    path = AssetSource('audio/tone.mp3');

    // set a callback for changing duration
    player.onDurationChanged.listen((Duration d) {
      setState(() => _duration = d);
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
      player.play(path);
      isPlaying = true;
    }
    setState(() {});
  }

  // Initialize a variable to store the dynamic value
  String debameterValue = 'Your Initial Value';
  

  // Your function to update the debameterValue based on some logic
  void updateDebameterValue() {
    // Your logic to update debameterValue
    // For example, you can simulate some dynamic changes
    debameterValue = 'New Value';
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
          width: 250,
        ),
        const SizedBox(height: 30),
        // Use a Container to display the dynamic value inside a box
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            debameterValue,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 50),
        const Text(
          'HEADSET').text.xl5.bold.make(),
        const Text(
          'CALIBRATION').text.xl5.bold.make(),
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
                // InkWell(
                //   onTap: () {
                //     player.seek(Duration(seconds: _position.inSeconds + 10));
                //     setState(() {});
                //   },
                //   child: Image.asset('assets/icons/forward.png'),
                // ),
              ],
            ),
      ],
      
    )));
  }
}