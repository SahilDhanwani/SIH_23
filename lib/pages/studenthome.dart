import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/object/student.dart';
import 'package:sih_23_audiometer/pages/background_noise.dart';
import 'package:sih_23_audiometer/utils/routes.dart';

// ignore: camel_case_types
class studenthome extends StatelessWidget {
  const studenthome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Student Information',
      home: StudentInfoPage(),
    );
  }
}

class StudentInfoPage extends StatelessWidget {
  const StudentInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Information'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage(
                  'assets/images/student.jpg'), // Replace with the correct image path
            ),
            const SizedBox(height: 20.0),
            const StudentDetails(),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const BackgroundNoise()));
                  },
                  child: const Text('Take test'),
                ),
                const SizedBox(width: 10.0),
                ElevatedButton(
                  onPressed: () => viewReport(context),
                  child: const Text('View Previous Report'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void takeTest(BuildContext context) {
  // Navigate to the MaxStudentPage when "Take Test" button is pressed
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MaxStudentPage()),
  );
}

void viewReport(BuildContext context) {
  // Add functionality for the "View Previous Report" button
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Under Development'),
        content: const Text('By Team_Karn...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

class MaxStudentPage extends StatelessWidget {
  const MaxStudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Max Student Page'),
      ),
      body: const Center(
        child: Text('This is the Max Student Page'),
      ),
    );
  }
}

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        StudentDetail(label: 'Class Code', value: 'ABC123'),
        StudentDetail(label: 'Name', value: 'John Doe'),
        StudentDetail(label: 'School', value: 'XYZ School'),
        StudentDetail(label: 'Age', value: '15'),
        StudentDetail(label: 'Roll No', value: '12345'),
        StudentDetail(label: 'Mobile Number', value: '123-456-7890'),
      ],
    );
  }
}

class StudentDetail extends StatelessWidget {
  final String label;
  final String value;

  const StudentDetail({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
