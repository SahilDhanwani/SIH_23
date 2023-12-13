import 'package:flutter/material.dart';
import 'package:headset_connection_event/headset_event.dart';

import '../utils/routes.dart';

class Headset extends StatefulWidget {
  const Headset({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HeadsetState createState() => _HeadsetState();
}

class _HeadsetState extends State<Headset> {
  final _headsetPlugin = HeadsetEvent();
  HeadsetState? _headsetState;

  @override
  void initState() {
    super.initState();

    _headsetPlugin.requestPermission();

    _headsetPlugin.getCurrentState.then((val) {
      setState(() {
        _headsetState = val;
      });
    });

    _headsetPlugin.setListener((val) {
      setState(() {
        _headsetState = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Headset Event Plugin'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Bluetooth Image and Text
                Column(
                  children: [
                    Image.asset(
                      'assets\\images\\bluetooth.png',
                      width: 100,
                      height: 100,
                    ),
                    const Text('Bluetooth'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ), // Add space between Bluetooth and Wired headphones

                // Wired Headphones Image and Text
                Column(
                  children: [
                    Image.asset(
                      "assets\\images\\headphone.png",
                      width: 100,
                      height: 100,
                    ),
                    const Text('Wired Headphones'),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ), // Add space between Wired headphones and button

                // Continue Button
                ElevatedButton(
                  onPressed: _headsetState == HeadsetState.CONNECT
                      ? () {
                          // Handle button click
                          // This block will only execute if the headset is connected
                          Navigator.pushNamed(context, MyRoutes.calibration);
                          // ignore: avoid_print
                          print('Continue button clicked');
                        }
                      : null, // Button disabled if headset is not connected
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      );
}
