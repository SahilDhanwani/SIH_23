import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sih_23_audiometer/pages/mixstudent.dart';
// ignore: unused_import
import 'package:sih_23_audiometer/pages/studadmin.dart';
import 'package:sih_23_audiometer/utils/routes.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 95, 215, 35),
              Color.fromARGB(255, 229, 99, 29)
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
                // Animated logo
                Hero(
                  tag: 'logo',
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.5, end: 1.0).animate(
                      CurvedAnimation(
                        curve: Curves.easeInOut,
                        parent: const AlwaysStoppedAnimation(1),
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                // Welcome text with a subtle shadow
                const Center(
                  child: Text(
                    'Welcome to Team_Karnas Audiometry App',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 2,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Subtitle with a larger font size
                const Text(
                  'Empower Your Silence: Deafness is Not a Barrier, Its a Unique Way of Listening.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 243, 244, 245),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                // Styled Get Started button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.studadmin);
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 8,
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // You can add more widgets or features here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
