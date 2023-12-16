// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

void main() {
  runApp(const adminhome());
}

class adminhome extends StatelessWidget {
  const adminhome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final String adminName = "John Doe";
  final String classCode = "CS101";
  final String schoolName = "Flutter High School";
  final String adminImagePath = "assets/images/admin.png";
  final String outsideImagePath = "assets/images/admin.png";

  const HomePage({super.key});

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
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Student Database',
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentDatabaseScreen()),
                );
              },
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
            Text(
              'School Name: $schoolName',
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Home',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StudentDatabaseScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Student Database',
                style: TextStyle(fontSize: 16.0),
              ),
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

class StudentDatabaseScreen extends StatelessWidget {
  const StudentDatabaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Database Screen'),
      ),
      body: const Center(
        child: Text('Welcome to the Student Database Screen!'),
      ),
    );
  }
}
