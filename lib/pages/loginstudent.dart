// ignore_for_file: unnecessary_string_escapes, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/utils/routes.dart';
import 'package:sih_23_audiometer/widgets/themes.dart';
class loginstudent extends StatefulWidget {
  @override
  State<loginstudent> createState() => _loginState();
}

class _loginState extends State<loginstudent> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState?.validate() ?? false) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.studentDashboard);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Column(
            children: [
              //Image.asset(
               // "assets/images/login.png",
               // fit: BoxFit.cover,
              //),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Enter username",
                    labelText: "username",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "username cana=not be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter password",
                    labelText: "password",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "password cannot be empty";
                    } else if (value!.length < 6) {
                      return "password length atleast be 6";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changebutton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        // shape: changebutton?BoxShape.circle:BoxShape.rectangle,
                      ),
                      child: changebutton
                          ? Icon(
                              Icons.done,
                              color: Colors.amber,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                    ),
                  ),
                )
                /*ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, myroutes.homeRoute);
                  },
                  style: TextButton.styleFrom(maximumSize: Size.fromWidth(100)),
                  child: Text("Login"),
                )*/
              ]
              )
            ],
          ),
        )));
  }
}



/*child: Container(
                    width: 150,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color:Colors.amber,
                        fontWeight: FontWeight.bold ,
                        fontSize: 18 
                      ),
                
                    ),
                  ),*/