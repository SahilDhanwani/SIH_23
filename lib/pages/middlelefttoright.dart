import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/pages/righteartest.dart';
import 'package:velocity_x/velocity_x.dart';

class LeftToRight extends StatelessWidget {
  // ignore: use_super_parameters
  const LeftToRight({Key? key, required this.leftValues}) : super(key: key);

  final List<double> leftValues;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 105, 181, 216),
                Color.fromARGB(255, 18, 99, 165)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/rightear.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(height: 20),
                Center(
                  child: 'RIGHT EAR TEST BEGINS'
                      .text
                      .bold
                      .size(20)
                      .purple700
                      .make(),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Add your button click logic here
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => RightEar(
                          rightValues: leftValues,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    // ignore: deprecated_member_use
                    primary: Colors.yellow,
                    // ignore: deprecated_member_use
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: 'Proceed'.text.size(18).make(),
                ).p16(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
