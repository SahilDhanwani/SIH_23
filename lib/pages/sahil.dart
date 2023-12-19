import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class Sahil extends StatefulWidget {
  const Sahil({super.key});

  @override
  State<Sahil> createState() => _SahilState();
}

class _SahilState extends State<Sahil> {

  // final _auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('admin');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child: FirebaseAnimatedList(
          query: ref, 
          itemBuilder: (BuildContext context, DataSnapshot snapshot, Animation<double> animation, int index) {
            return ListTile(
              title: Text(snapshot.child('class_code').value.toString()),
              subtitle: Text(snapshot.child('School').value.toString()),
            );
          }))
      ]),
    );
  }
}
