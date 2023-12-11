import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sih_23_audiometer/pages/home_page.dart';
import 'package:sih_23_audiometer/pages/student_dashboard.dart';
import 'package:sih_23_audiometer/pages/student_login.dart';
import 'package:sih_23_audiometer/pages/student_signup.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Permission.microphone.request();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.backgroundNoise,
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.studentLoginRoute: (context) => const student_login(),
        MyRoutes.studentDashboard: (context) => const StudentDashboard(),
        MyRoutes.studentSignupRoute: (context) => const StudentSignup(),
        // MyRoutes.backgroundNoise: (context) => const BackgroundNoise(),
      },
    ); 
  }
}