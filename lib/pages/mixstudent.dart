import 'package:flutter/material.dart';

void main() {
  runApp(const mixstudent());
}

// ignore: camel_case_types
class mixstudent extends StatelessWidget {
  const mixstudent({super.key});

  @override
  Widget build(BuildContext context) {
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
      appBar: AppBar(
        title: const Text("Student Login/Signup"),
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
                children: const [
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
    );
  }
}

class StudentLoginForm extends StatelessWidget {
  const StudentLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Username',
              hintText: 'Enter your username',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
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
              // Implement your student login logic here
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}

class StudentSignupForm extends StatelessWidget {
  const StudentSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: 'Full Name',
              hintText: 'Enter your full name',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Roll No',
              hintText: 'Enter your roll number',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Class',
              hintText: 'Enter your class',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'DOB',
              hintText: 'Enter your date of birth',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Age',
              hintText: 'Enter your age',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Gender',
              hintText: 'Enter your gender',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Class Code',
              hintText: 'Enter your class code',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const TextField(
            decoration: InputDecoration(
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
              // Implement your student signup logic here
            },
            child: const Text('Signup'),
          ),
        ],
      ),
    );
  }
}
