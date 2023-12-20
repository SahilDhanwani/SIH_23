import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sih_23_audiometer/object/student.dart';
import 'package:sih_23_audiometer/utils/routes.dart';

// ignore: camel_case_types, must_be_immutable
class addstudent extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollNoController = TextEditingController();
  final TextEditingController classController = TextEditingController();

  final CollectionReference studentsCollection =
      FirebaseFirestore.instance.collection('students');

  addstudent({super.key});

  Student temp = Student();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Students'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.adminhome);
              },
              style: ElevatedButton.styleFrom(
                elevation: 8,
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Text(
                'Home Page ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'Enter student name',
              ),
            ),
            TextFormField(
              controller: rollNoController,
              decoration: const InputDecoration(
                labelText: 'Roll Number',
                hintText: 'Enter roll number',
              ),
            ),
            TextFormField(
              controller: classController,
              decoration: const InputDecoration(
                labelText: 'Standard',
                hintText: 'Enter student year',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                temp.name = nameController.text.toString();
                temp.rollNo = rollNoController.text.toString();
                temp.std = classController.text.toString();
                Navigator.pushNamed(context, MyRoutes.backgroundNoise);
              },
              style: ElevatedButton.styleFrom(
                elevation: 8,
                backgroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              child: const Text(
                'Take Test',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
