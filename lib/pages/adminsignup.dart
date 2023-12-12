import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';
class User {
  String name = '';
  String rollNo = '';
  DateTime dob = DateTime.now();
  String gender = '';
  String username = '';
  String classCode = '';
  String password = '';
}

// ignore: camel_case_types
class adminsignup extends StatefulWidget {
  const adminsignup({super.key});

  @override
  _adminsignupState createState() => _adminsignupState();
}

class _adminsignupState extends State<adminsignup> {
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
              Image.asset('assets/your_image.png'), // Replace with your image asset

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
                decoration: const InputDecoration(labelText: 'Date of Birth'),
                validator: (value) {
                  // You can add date validation logic if needed
                  return null;
                },
                onSaved: (value) {
                  // Convert the string to DateTime and assign it to user.dob
                  user.dob = DateTime.parse(value!);
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
        title: const Text('Next Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('User Details:'),
            Text('Name: ${user.name}'),
            Text('Roll No: ${user.rollNo}'),
            Text('DOB: ${user.dob}'),
            Text('Gender: ${user.gender}'),
            Text('Username: ${user.username}'),
            Text('Class Code: ${user.classCode}'),
            Text('Password: ${user.password}'),
          ],
        ),
      ),
    );
  }
}
