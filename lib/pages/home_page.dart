import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/admin.png',
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, MyRoutes.homeRoute); // Navigate to home screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    MyTheme.buttonColor, // Use the button color from theme
              ),
              child: const Text('Admin'),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/eduapp_student_login.jpg',
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, MyRoutes.studentLoginRoute); // Navigate to home screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    MyTheme.buttonColor, // Use the button color from theme
              ),
              child: const Text('Student'),
            ),
          ],
        ),
      ),
    );
  }
}
