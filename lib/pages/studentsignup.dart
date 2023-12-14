import 'package:flutter/material.dart';

import '../utils/routes.dart';

class User {
  String name = '';
  String rollNo = '';
  int age = 0; // Change the type to int for age
  String gender = '';
  String username = '';
  String classCode = '';
  String password = '';
}

class StudentSignup extends StatefulWidget {
  const StudentSignup({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _adminsignupState createState() => _adminsignupState();
}

// ignore: camel_case_types
class _adminsignupState extends State<StudentSignup> {
  final User user = User();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset(
                  'assets/images/eduapp_student_login.jpg'), // Replace with your image asset

              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  user.name = value!;
                },
              ),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Roll No'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Roll No';
                  }
                  return null;
                },
                onSaved: (value) {
                  user.rollNo = value!;
                },
              ),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Age'),
                keyboardType:
                    TextInputType.number, // Set keyboard type to number
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
                onSaved: (value) {
                  user.age = int.parse(value!); // Convert string to int for age
                },
              ),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Gender'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your gender';
                  }
                  return null;
                },
                onSaved: (value) {
                  user.gender = value!;
                },
              ),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                onSaved: (value) {
                  user.username = value!;
                },
              ),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Class Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your class code';
                  }
                  return null;
                },
                onSaved: (value) {
                  user.classCode = value!;
                },
              ),

              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  user.password = value!;
                },
                obscureText: true, // For password fields
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    // Navigate to the next page with user details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NextPage(user: user),
                      ),
                    );
                  }
                },
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  final User user;

  const NextPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('User Details:'),
            Text('Name: ${user.name}'),
            Text('Roll No: ${user.rollNo}'),
            Text('Age: ${user.age}'), // Display age instead of DOB
            Text('Gender: ${user.gender}'),
            Text('Username: ${user.username}'),
            Text('Class Code: ${user.classCode}'),
            Text('Password: ${user.password}'),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.backgroundNoise);
            },
            child: const Text('Proceed'),
          ),
        ),
      ),
    );
  }
}
