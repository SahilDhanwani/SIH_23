import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/pages/adminhome.dart';

// ignore: camel_case_types
class mixadmin extends StatelessWidget {
  const mixadmin({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Login/Signup"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ToggleButtons(
              isSelected: [_currentPage == 0, _currentPage == 1],
              onPressed: (index) {
                setState(() {
                  _currentPage = index;
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                });
              },
              children: const [
                Text("Login"),
                Text("Signup"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  // Admin Login Page
                  AdminLoginForm(),
                  // Admin Signup Page
                  AdminSignupForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AdminLoginForm extends StatelessWidget {
  AdminLoginForm({super.key});

  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final password = TextEditingController();
  // ignore: non_constant_identifier_names
  final class_code = TextEditingController();
  final String adder = '@karn.com';
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: class_code,
              decoration: const InputDecoration(
                labelText: 'Class Code',
                hintText: 'Enter your class code',
              ),
            ),
            
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                late String result;
                result = class_code.text.toString() + adder;
                _auth.signInWithEmailAndPassword(email: result, password: password.text.toString());

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>  adminhome(username: class_code.text.toString())));
              },
              child: const Text('Login'),
            ),
          ],
        ),
      )
    );
  }
}

class AdminSignupForm extends StatelessWidget {
  AdminSignupForm({super.key});

  final String adder = '@karn.com';
  final name = TextEditingController();
  final school = TextEditingController();
  // ignore: non_constant_identifier_names
  final class_code = TextEditingController();
  final pass1 = TextEditingController();
  final pass2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final adminRef = FirebaseDatabase.instance.ref('admin');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your full name',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: school,
              decoration: const InputDecoration(
                labelText: 'School Name',
                hintText: 'Enter your school name',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: class_code,
              decoration: const InputDecoration(
                labelText: 'Class Code',
                hintText: 'Enter your class code',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: pass1,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: pass2,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                hintText: 'Confirm your password',
              ),
              obscureText: true,
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                late String result;
                result = class_code.text.toString() + adder;
                _auth.createUserWithEmailAndPassword(
                  email: result,password: pass1.text.toString(),
                );
 
                adminRef.child(class_code.text.toString()).set({
                  'Name' : name.text.toString(),
                  'School' : school.text.toString(),
                  'class_code' : class_code.text.toString(),
                });

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      adminhome(username: class_code.text.toString() + adder)));
            },
            child: const Text('Signup'),
          ),
        ],
      ),
    ));
  }
}
