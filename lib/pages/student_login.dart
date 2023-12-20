import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sih_23_audiometer/pages/mixstudent.dart';
import 'package:sih_23_audiometer/utils/routes.dart';

void main() {
  runApp(const studentlogin());
}

// ignore: camel_case_types
class studentlogin extends StatelessWidget {
  const studentlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomePage(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 82, 153, 210),
              Color.fromARGB(255, 222, 94, 85)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Welcome to Audiometry App',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 65, 39, 149),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Empower Your Silence: Deafness is Not a Barrier, Its a Unique Way of Listening.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the Mixstudent screen
                    Navigator.pushNamed(context, MyRoutes.Mixstudent);
                  },
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: const Text('Get Started'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
