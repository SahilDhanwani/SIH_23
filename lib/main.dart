import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/object/admin.dart';
import 'package:sih_23_audiometer/object/student.dart';
import 'package:sih_23_audiometer/pages/Calibration.dart';
import 'package:sih_23_audiometer/pages/LocaleString.dart';
import 'package:sih_23_audiometer/pages/addstudent.dart';
import 'package:sih_23_audiometer/pages/adminhome.dart';
import 'package:sih_23_audiometer/pages/chatbot.dart';
import 'package:sih_23_audiometer/pages/dashbord.dart';
import 'package:sih_23_audiometer/pages/graph.dart';
import 'package:sih_23_audiometer/pages/headset.dart';
// ignore: unused_import
import 'package:sih_23_audiometer/pages/home_page.dart';
import 'package:sih_23_audiometer/pages/lefteartest.dart';
import 'package:sih_23_audiometer/pages/logsignadmin.dart';
import 'package:sih_23_audiometer/pages/mixadmin.dart';
import 'package:sih_23_audiometer/pages/mixstudent.dart';
import 'package:sih_23_audiometer/pages/student_login.dart';
import 'package:sih_23_audiometer/pages/studentsignup.dart';
import 'package:sih_23_audiometer/pages/background_noise.dart';
import 'package:sih_23_audiometer/pages/loginadmin.dart';
import 'package:sih_23_audiometer/pages/loginstudent.dart';
import 'package:sih_23_audiometer/pages/logsignstu.dart';
import 'package:sih_23_audiometer/pages/righteartest.dart';
import 'package:sih_23_audiometer/pages/studadmin.dart';
import 'package:sih_23_audiometer/pages/student_dashboard.dart';
import 'package:sih_23_audiometer/pages/student_signin.dart';
import 'package:sih_23_audiometer/pages/translations.dart';
import 'package:sih_23_audiometer/pages/welcome.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';
import 'package:sih_23_audiometer/pages/studenthome.dart';
import 'package:get/get.dart';

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

  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  Admin temp = Admin();
  Student temp2 = Student();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: const Locale('en', 'US'),
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.studadmin,
      routes: {
        //  MyRoutes.homeRoute: (context) => const HomePage(), //First page(Admin/Student)
        MyRoutes.studentLoginRoute: (context) =>
            const studentlogin(), //Second page(Logini/Signup)
        MyRoutes.studentDashboard: (context) =>
            const StudentDashboard(), //Student Home Page
        MyRoutes.studentSigninRoute: (context) =>
            const StudentSignin(), //Student Login
        MyRoutes.backgroundNoise: (context) => const BackgroundNoise(),
        MyRoutes.leftear: (context) => const LeftEar(),
        MyRoutes.chatbot: (context) => const ChatBot(),
        MyRoutes.rightear: (context) =>
            // ignore: prefer_const_constructors
            RightEar(leftValues: const [80, 80, 80, 80, 80, 80]),
        MyRoutes.graph: (context) => const Graph(
            leftValues: [80, 80, 80, 80, 80, 80],
            rightValues: [80, 80, 80, 80, 80, 80]),
        MyRoutes.calibration: (context) => const Calibration(),
        // MyRoutes.chatbot: (context) => const ChatBot(),
        MyRoutes.logsignstu: (context) => const LogSignStu(),
        MyRoutes.loginadmin: (context) => const loginadmin(),
        MyRoutes.logsignadmin: (context) => logsignadmin(),
        MyRoutes.loginstudent: (context) => const LoginStudent(),
        //MyRoutes.adminsignup: (context) => const adminsignup(),
        // MyRoutes.Calibration: (context) => const Calibration(),
        MyRoutes.loginstudent: (context) => const LoginStudent(),
        MyRoutes.studentsignup: (context) => const StudentSignup(),
        // Files of AbhishekBHosale02
        MyRoutes.studadmin: (context) => const studadmin(),
        MyRoutes.LanguageSelectionPage: (context) => LanguageSelectionPage(),
        MyRoutes.mixadmin: (context) => const mixadmin(),
        MyRoutes.Mixstudent: (context) => const Mixstudent(),
        MyRoutes.headset: (context) => const Headset(),
        // MyRoutes.adminhome: (context) => adminhome(),
        MyRoutes.studenthome: (context) => studenthome(temp2),
        MyRoutes.Dashboard: (context) => const Dashboard(),
        MyRoutes.Welcome: (context) => const Welcome(),
        // MyRoutes.adminhome: (context) => adminhome(username: 'fg'),
        // MyRoutes.addstudent: (context) => const addstudent(),
      },
    );
  }
}
