import 'package:flutter/material.dart';
import 'package:headset_connection_event/headset_event.dart';
import 'package:velocity_x/velocity_x.dart';
import '../utils/routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPress;
  final VoidCallback? onRefreshPress;

  const CustomAppBar({super.key, this.onBackPress, this.onRefreshPress});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Headset Connection'),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: onBackPress,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: onRefreshPress,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_headsetState == HeadsetState.CONNECT
                ? 'Headset Connected'
                : 'Headset Disconnected'),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          // appBar: CustomAppBar(
          //   onBackPress: () {
          //     Navigator.pop(context); // Go back to the previous screen
          //   },
          //   onRefreshPress: _refreshConnectionState,
          // ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 33, 164, 187),
                  Color.fromARGB(255, 20, 162, 170),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50),
                Center(
                  child: const Text("Dear Student")
                      .text
                      .xl4
                      .bold
                      .color(const Color.fromARGB(255, 7, 5, 5))
                      .make(),
                ),
                const SizedBox(height: 16),
                Center(
                  child: const Text("Connect Your Headsets")
                      .text
                      .xl4
                      .bold
                      .color(const Color.fromARGB(255, 7, 5, 5))
                      .make(),
                ),
                const SizedBox(height: 16),
                // Bluetooth Image and Text
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets\\images\\bluetooth.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 8),
                      const Text('Bluetooth',
                          style:
                              TextStyle(color: Color.fromARGB(255, 226, 9, 9))),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: const Text("OR")
                      .text
                      .xl4
                      .bold
                      .color(const Color.fromARGB(255, 7, 5, 5))
                      .make(),
                ),
                const SizedBox(height: 10),
                // Wired Headphones Image and Text
                Expanded(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets\\images\\headphone.png",
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 8),
                      const Text('Wired Headphones',
                          style:
                              TextStyle(color: Color.fromARGB(255, 237, 1, 1))),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
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
                      : null,
                  child: const Text('Continue'),
                ),
                const SizedBox(height: 16),
                // Refresh Button
                ElevatedButton(
                  onPressed: _refreshConnectionState,
                  child: const Text('Refresh Connection'),
                ),
                const SizedBox(height: 16),
                // Previous Screen Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous screen
                  },
                  child: const Text('Previous Screen'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      );

  // Method to refresh the connection state
  void _refreshConnectionState() {
    _headsetPlugin.getCurrentState.then((val) {
      setState(() {
        _headsetState = val;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_headsetState == HeadsetState.CONNECT
                ? 'Headset Connected'
                : 'Headset Disconnected'),
          ),
        );
      });
    });
  }
}