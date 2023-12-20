import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';

class studadmin extends StatelessWidget {
  const studadmin({super.key});

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
                    context, MyRoutes.mixadmin); // Navigate to admin screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyTheme.buttonColor,
              ),
              child: const Text('Admin'),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/student.jpg',
              height: 150,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, MyRoutes.Mixstudent); // Navigate to student screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyTheme.buttonColor,
              ),
              child: const Text('Student'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle the action when the floating button is pressed
          // Add your custom action or navigation here
        },
        backgroundColor: MyTheme.buttonColor, // Use the button color from theme
        child: Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
