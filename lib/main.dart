import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/pages/Calibration.dart';
import 'package:sih_23_audiometer/pages/adminhome.dart';
import 'package:sih_23_audiometer/pages/graph.dart';
import 'package:sih_23_audiometer/pages/headset.dart';
import 'package:sih_23_audiometer/pages/home_page.dart';
import 'package:sih_23_audiometer/pages/lefteartest.dart';
import 'package:sih_23_audiometer/pages/logsignadmin.dart';
import 'package:sih_23_audiometer/pages/mixadmin.dart';
import 'package:sih_23_audiometer/pages/mixstudent.dart';
import 'package:sih_23_audiometer/pages/studentsignup.dart';
import 'package:sih_23_audiometer/pages/background_noise.dart';
import 'package:sih_23_audiometer/pages/loginadmin.dart';
import 'package:sih_23_audiometer/pages/loginstudent.dart';
import 'package:sih_23_audiometer/pages/logsignstu.dart';
import 'package:sih_23_audiometer/pages/righteartest.dart';
import 'package:sih_23_audiometer/pages/studadmin.dart';
import 'package:sih_23_audiometer/pages/student_dashboard.dart';
import 'package:sih_23_audiometer/pages/student_login.dart';
import 'package:sih_23_audiometer/pages/student_signin.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';
import 'package:sih_23_audiometer/pages/studenthome.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyDEVvqPd1AAmogTmT2dk3d7sJrFyLpD-XM",
            appId: "1:760454313508:android:3dc77bb2c6739b4517cab1",
            messagingSenderId: "760454313508",
            projectId: "sih23-e0515",
          ),
        )
      : await Firebase.initializeApp();

  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: MyRoutes.leftear,
      routes: {
        MyRoutes.homeRoute: (context) =>
            const HomePage(), //First page(Admin/Student)
        MyRoutes.studentLoginRoute: (context) =>
            const student_login(), //Second page(Logini/Signup)
        MyRoutes.studentDashboard: (context) =>
            const StudentDashboard(), //Student Home Page
        MyRoutes.studentSigninRoute: (context) =>
            const StudentSignin(), //Student Login
        MyRoutes.backgroundNoise: (context) => const BackgroundNoise(),
        MyRoutes.leftear: (context) => const LeftEar(),
        MyRoutes.rightear: (context) =>
            RightEar(leftValues: [0, 0, 0, 0, 0, 0]),
        MyRoutes.graph: (context) => Graph(
            leftValues: [0, 0, 0, 0, 0, 0], rightValues: [0, 0, 0, 0, 0, 0]),
        MyRoutes.calibration: (context) => const Calibration(),
        MyRoutes.logsignstu: (context) => const LogSignStu(),
        MyRoutes.loginadmin: (context) => const loginadmin(),
        MyRoutes.logsignadmin: (context) => logsignadmin(),
        MyRoutes.loginstudent: (context) => const loginstudent(),
        MyRoutes.adminsignup: (context) => const adminsignup(),
        MyRoutes.Calibration: (context) => const Calibration(),
        MyRoutes.loginstudent: (context) => const LoginStudent(),
        MyRoutes.studentsignup: (context) => const StudentSignup(),
        // Files of AbhishekBHosale02
        MyRoutes.studadmin: (context) => const studadmin(),
        MyRoutes.mixadmin: (context) => const mixadmin(),
        MyRoutes.Mixstudent: (context) => const Mixstudent(),
        MyRoutes.headset: (context) => const Headset(),
        MyRoutes.adminhome: (context) => const adminhome(
              username: '',
            ),

        MyRoutes.studenthome: (context) => const studenthome(),
      },
    );
  }
}
