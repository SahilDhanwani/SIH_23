import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/utils/routes.dart';

// ignore: camel_case_types, must_be_immutable
class adminhome extends StatelessWidget {
  String username; 
  adminhome({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(username),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String username;

  // Updated constructor to take username
  HomePage(this.username,{super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  String adminName = 'NA';
  String classCode = 'NA';
  String schoolName = 'NA';
  final String adminImagePath = "assets/images/admin.png";
  final String outsideImagePath = "assets/images/admin.png";
  DatabaseReference adminRef = FirebaseDatabase.instance.ref('admin');

  // ignore: non_constant_identifier_names
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
              accountName: Text(adminName),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(adminImagePath),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Customize button color
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
          FirebaseAnimatedList(
          query: adminRef, 
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
            // print('INSIDE FIREBASE');
            if(snapshot.child('class_code').value.toString() == widget.username) {

              setState(() {
                classCode = snapshot.child('class_code').value.toString();
                adminName = snapshot.child('Name').value.toString();
                schoolName = snapshot.child('School').value.toString();
              });
            }
            return const SizedBox(height: 1);
          },
        ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                outsideImagePath,
                height: 120.0,
                width: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Admin Name: $adminName',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            Text(
              'Class Code: $classCode',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            // Display the fetched school name
            Text(
              'School Name: $schoolName',
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
