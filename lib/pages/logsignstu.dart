import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';

class LogSignStu extends StatelessWidget {
  const LogSignStu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome to the Stylish World of LogSignStu!
            SizedBox(height: 20),
            // Press this button to enter the Elegance Portal
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.loginstudent);
              },
              style: ElevatedButton.styleFrom(
                // ignore: deprecated_member_use
                primary: Color.fromRGBO(245, 14, 14, 1),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),
            // Now, witness the Majestic Signupus Elegancius in its natural habitat
            SizedBox(height: 20),
            // Want a ticket to the Elegant Affair? Press the Signup Button!
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.studentDashboard);
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 8, 241, 106),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'Signup',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
