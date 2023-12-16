// ignore_for_file: camel_case_types

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';


class volumeControl extends StatelessWidget {
  const volumeControl({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double currentvol = 0.5;

  double linearToDb(double linearValue) {
    return 20 * log(linearValue) / log(10);
  }

  double dbToLinear(double dbValue) {
    return (pow(10, dbValue / 20) as double);
  }

  @override
  void initState() {
    PerfectVolumeControl.hideUI = false;
    Future.delayed(Duration.zero, () async {
      currentvol = await PerfectVolumeControl.getVolume();
      setState(() {
        // Refresh UI
      });
    });

    PerfectVolumeControl.stream.listen((volume) {
      setState(() {
        currentvol = volume;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Increase/Decrease Volume in Flutter"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Current Volume (Linear): $currentvol"),
            Text("Current Volume (dB): ${linearToDb(currentvol).toStringAsFixed(2)} dB"),

            const Divider(),

            Slider(
              value: currentvol,
              onChanged: (newvol) {
                currentvol = newvol;
                PerfectVolumeControl.setVolume(newvol);
                setState(() {});
              },
              min: 0,
              max: 1,
              divisions: 100,
            ),
          ],
        ),
      ),
    );
  }
}






