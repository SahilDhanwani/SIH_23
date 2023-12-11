import 'package:flutter/material.dart';
import 'package:headset_connection_event/headset_event.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _headsetPlugin = HeadsetEvent();
  HeadsetState? _headsetState;

  @override
  void initState() {
    super.initState();

    _headsetPlugin.requestPermission();

    // ignore: no_leading_underscores_for_local_identifiers
    _headsetPlugin.getCurrentState.then((_val) {
      setState(() {
        _headsetState = _val;
      });
    });

    // ignore: no_leading_underscores_for_local_identifiers
    _headsetPlugin.setListener((_val) {
      setState(() {
        _headsetState = _val;
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
                      'assets\\images\\bluetooth_image.png',
                      width: 100,
                      height: 100,
                    ),
                    const Text('Bluetooth'),
                  ],
                ),
                const SizedBox(
                    height:
                        20), // Add space between Bluetooth and Wired headphones

                // Wired Headphones Image and Text
                Column(
                  children: [
                    Image.asset(
                      "assets\\images\\headphone_image.png",
                      width: 100,
                      height: 100,
                    ),
                    const Text('Wired Headphones'),
                  ],
                ),
                const SizedBox(
                    height:
                        20), // Add space between Wired headphones and button

                // Continue Button
                ElevatedButton(
                  onPressed: _headsetState == HeadsetState.CONNECT
                      ? () {
                          // Handle button click
                          // This block will only execute if the headset is connected
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
