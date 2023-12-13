import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/pages/adminsignup.dart';
import 'package:sih_23_audiometer/pages/background_noise.dart';
import 'package:sih_23_audiometer/pages/headset.dart';
import 'package:sih_23_audiometer/pages/Calibration.dart';
import 'package:sih_23_audiometer/pages/home_page.dart';
import 'package:sih_23_audiometer/pages/lefteartest.dart';
import 'package:sih_23_audiometer/pages/loginadmin.dart';
import 'package:sih_23_audiometer/pages/loginstudent.dart';
import 'package:sih_23_audiometer/pages/logsignadmin.dart';
import 'package:sih_23_audiometer/pages/logsignstu.dart';
import 'package:sih_23_audiometer/pages/righteartest.dart';
import 'package:sih_23_audiometer/pages/studadmin.dart';
import 'package:sih_23_audiometer/pages/student_dashboard.dart';
import 'package:sih_23_audiometer/pages/student_login.dart';
import 'package:sih_23_audiometer/pages/student_signup.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Permission.microphone.request();
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
<<<<<<< HEAD
      initialRoute: MyRoutes.Calibration,
=======
      initialRoute: MyRoutes.rightear,
>>>>>>> de64243 (right ear added)
      routes: {
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.studentLoginRoute: (context) => const student_login(),
        MyRoutes.studentDashboard: (context) => const StudentDashboard(),
        MyRoutes.studentSignupRoute: (context) => const StudentSignup(),
        MyRoutes.backgroundNoise: (context) => const BackgroundNoise(),
        MyRoutes.headset: (context) => const Headset(),
        MyRoutes.leftear: (context) => LeftEar(),
<<<<<<< HEAD
        
=======
        MyRoutes.rightear: (context) => RightEar(),
        // MyRoutes.calibration_check:(context)=> Calibration(),
        MyRoutes.calibration_check: (context) => const Calibration(),
>>>>>>> de64243 (right ear added)
        // MyRoutes.backgroundNoise: (context) => const BackgroundNoise(),
        MyRoutes.studadmin: (context) => const studadmin(),
        MyRoutes.logsignstu: (context) => const logsignstu(),
        MyRoutes.loginadmin: (context) => const loginadmin(),
        MyRoutes.logsignadmin: (context) => logsignadmin(),
        MyRoutes.loginstudent: (context) => const loginstudent(),
        MyRoutes.adminsignup: (context) => const adminsignup(),
        MyRoutes.Calibration:(context)=> const Calibration(),

      },
    );
  }
}
