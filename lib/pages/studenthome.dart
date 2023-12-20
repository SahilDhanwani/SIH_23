import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/object/student.dart';
import 'package:sih_23_audiometer/pages/background_noise.dart';

// ignore: camel_case_types, must_be_immutable
class studenthome extends StatelessWidget {
  Student temp;
  studenthome(this.temp, {super.key});

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
            StudentDetails(temp),
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

// ignore: must_be_immutable
class StudentDetails extends StatelessWidget {
  Student temp;
  StudentDetails(this.temp, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StudentDetail(label: 'Class Code', value: temp.classCode),
        StudentDetail(label: 'Name', value: temp.name),
        StudentDetail(label: 'DOB', value: temp.dob),
        StudentDetail(label: 'Age', value: temp.age),
        StudentDetail(label: 'Roll No', value: temp.rollNo),
        StudentDetail(label: 'Gender', value: temp.gender),
        StudentDetail(label: 'STD', value: temp.std),



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
