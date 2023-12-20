import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/utils/routes.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/bluebackground.png',
            fit: BoxFit.cover,
          ),

          // Content
          Container(
            // decoration: const BoxDecoration(
            //   gradient: RadialGradient(
            //     colors: [
            //       Color.fromARGB(255, 238, 244, 244),
            //       Color.fromARGB(255, 136, 186, 200),
            //     ],
            //     center: Alignment.center,
            //     radius: 1.30,
            //   ),
            // ),
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
                        'Audiometry App',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 8, 14),
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
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    // Styled Get Started button
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.studadmin);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 8,
                        backgroundColor: Color.fromARGB(255, 81, 83, 198) ,
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
                          color: Color.fromARGB(255, 221, 225, 221),
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
        ],
      ),
    );
  }
}
