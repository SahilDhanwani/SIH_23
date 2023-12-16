import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';

class LogSignStu extends StatelessWidget {
  const LogSignStu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome to the Stylish World of LogSignStu!
            const SizedBox(height: 20),
            // Press this button to enter the Elegance Portal
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.loginstudent);
              },
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: const Color.fromRGBO(245, 14, 14, 1),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            // Now, witness the Majestic Signupus Elegancius in its natural habitat
            const SizedBox(height: 20),
            // Want a ticket to the Elegant Affair? Press the Signup Button!
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.studentDashboard);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 8, 241, 106),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Signup',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
