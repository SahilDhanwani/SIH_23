
import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';



// ignore: camel_case_types
class studadmin extends StatelessWidget {
  const  studadmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              const Text(
            'Welcome',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              //color: MyTheme.textColor,
            ),
          ),
          const SizedBox(height: 20),

            Image.asset(
              'assets/images/admin.png',
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, MyRoutes.mixadmin); // Navigate to home screen
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
                    context, MyRoutes.Mixstudent); // Navigate to home screen
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