import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sih_23_audiometer/object/student.dart';
import 'package:sih_23_audiometer/pages/studenthome.dart';
// ignore: unused_import
import 'package:sih_23_audiometer/utils/routes.dart';

// ignore: camel_case_types
class Mixstudent extends StatelessWidget {
  const Mixstudent({super.key});
  

  @override
  Widget build(BuildContext context) {
    // ignore: unused_label

    return const MaterialApp(
      home: StudentPage(),
    );
  }
}

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set background color to transparent
      appBar: AppBar(
        title: const Text("Student Login/Signup"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 238, 244, 244),
              Color.fromARGB(255, 136, 186, 200),
            ],
            center: Alignment.center,
            radius: 1.30,
          ),
        ),
        child: Padding(
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
                    // Student Login Page
                    StudentLoginForm(),
                    // Student Signup Page
                    StudentSignupForm(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class StudentLoginForm extends StatelessWidget {
  StudentLoginForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final password = TextEditingController();
  final email = TextEditingController();
  // ignore: non_constant_identifier_names
  Student Sobj = Student();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
              labelText: 'E-mail Address',
              hintText: 'Enter your email address',
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
              Sobj.email = email.text.toString();

              _auth.signInWithEmailAndPassword(
                  email: email.text.toString(),
                  password: password.text.toString());
            },
              style: ElevatedButton.styleFrom(
                        elevation: 8,
                        backgroundColor: Color.fromARGB(255, 39, 115, 191) ,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(

                          
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
            child: const Text('Login'),
          ),
        ],
      ),
    ));
  }
}

// ignore: must_be_immutable
class StudentSignupForm extends StatelessWidget {
  StudentSignupForm({super.key});

  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final name = TextEditingController();
  final age = TextEditingController();
  // ignore: non_constant_identifier_names
  final roll_no = TextEditingController();
  final std = TextEditingController();
  final dob = TextEditingController();
  final gender = TextEditingController();
  // ignore: non_constant_identifier_names
  final class_code = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final studentRef = FirebaseDatabase.instance.ref('student');
  // ignore: non_constant_identifier_names
  Student Sobj = Student();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
              labelText: 'E-mail Address',
              hintText: 'Enter your email address',
              ),
            ),

            const SizedBox(
              height: 16,
            ),

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
              controller: roll_no,
              decoration: const InputDecoration(
                labelText: 'Roll No',
                hintText: 'Enter your roll number',
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            TextFormField(
              controller: std,
              decoration: const InputDecoration(
                labelText: 'Class',
                hintText: 'Enter your class',
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            TextFormField(
              controller: dob,
              decoration: const InputDecoration(
                labelText: 'DOB',
                hintText: 'Enter your date of birth',
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            TextFormField(
              controller: age,
              decoration: const InputDecoration(
                labelText: 'Age',
                hintText: 'Enter your age',
              ),
            ),

            const SizedBox(
              height: 16,
            ),

            TextFormField(
              controller: gender,
              decoration: const InputDecoration(
                labelText: 'Gender',
                hintText: 'Enter your gender',
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
                _auth.createUserWithEmailAndPassword(
                  email: email.text.toString(),
                  password: password.text.toString(),
                );
 
                studentRef.child(email.text.toString()).set({
                  'E-mail' : email.text.toString(),
                  'name' : name.text.toString(),
                  'roll no' : roll_no.text.toString(),
                  'std' : std.text.toString(),
                  'dob' : dob.text.toString(),
                  'age' : age.text.toString(),
                  'gender' : gender.text.toString(),
                  'class_code' : class_code.text.toString()
                });
              },
                style: ElevatedButton.styleFrom(
                        elevation: 8,
                        backgroundColor: const Color.fromARGB(255, 39, 115, 191) ,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(

                          
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
              child: const Text('Signup'),
            ),
          ],
        ),
      )
    );
  }
}
