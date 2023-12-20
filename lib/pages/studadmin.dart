import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';

class studadmin extends StatelessWidget {
  const studadmin({Key? key});

  Widget buildBackgroundImage() {
    return Image.asset(
      'assets/images/bluebackground.png',
      fit: BoxFit.cover,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          buildBackgroundImage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/admin.png',
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, MyRoutes.mixadmin); // Navigate to home screen
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
                  child: const Text('Admin'),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/student.jpg',
                  //   ' assets/images/image.png',
                  height: 150,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,
                        MyRoutes.Mixstudent); // Navigate to home screen
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
                  child: Text('Student'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
