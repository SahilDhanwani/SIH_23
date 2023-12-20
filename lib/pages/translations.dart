import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';

class LanguageSelectionPage extends StatelessWidget {
  // ignore: use_super_parameters
  LanguageSelectionPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> languages = [
    {'name': 'ENGLISH', 'locale': const Locale('en', 'US')},
    {'name': 'ಕನ್ನಡ', 'locale': const Locale('kn', 'IN')},
    {'name': 'हिंदी', 'locale': const Locale('hi', 'IN')},
  ];

  void updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  void buildLanguageDialog(BuildContext context) {
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
                    child: Text(languages[index]['name']),
                    onTap: () {
                      // ignore: avoid_print
                      print(languages[index]['name']);
                      updateLanguage(languages[index]['locale']);
                    },
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.blue,
                );
              },
              itemCount: languages.length,
            ),
          ),
        );
      },
    );
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
                backgroundColor: MyTheme.buttonColor,
              ),
              child: const Text("Change Language"),
            ),
          ],
        ),
      ),
    );
  }
}
