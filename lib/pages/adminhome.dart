import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/object/admin.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';

class adminhome extends StatelessWidget {
  // ignore: non_constant_identifier_names
  Admin Aobj;
  adminhome(this.Aobj, {super.key});

  final String adminImagePath = "assets/images/admin.png";
  final String outsideImagePath = "assets/images/admin.png";
  DatabaseReference adminRef = FirebaseDatabase.instance.ref('admin');
  bool firstRun = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home Page'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(Aobj.name),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(adminImagePath),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.Dashboard);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: MyTheme.buttonColor,
              ),
              child: const Text('Database'),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                outsideImagePath,
                height: 150.0,
                width: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),

            Text(
              'Admin Name: ${Aobj.name}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Class Code: ${Aobj.classCode}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            // Display the fetched school name
            Text(
              'School Name: ${Aobj.school}',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.leftear);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Customize button color
              ),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}
