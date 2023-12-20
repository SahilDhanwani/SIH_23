// second page student + admin
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';

// ignore: camel_case_types
class studadmin extends StatelessWidget {
  studadmin({super.key});
  final List locale = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'ಕನ್ನಡ', 'locale': const Locale('kn', 'IN')},
    {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
  ];
  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: const Text('Choose Your Language'),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                 buildLanguageDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    MyTheme.buttonColor, // Use the button color from theme
              ),
              child: const Text("chnage language"),
            ),
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
              'assets/images/student.jpg',
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
              child: Text('hello'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
