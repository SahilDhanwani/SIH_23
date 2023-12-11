import 'package:flutter/material.dart';
import 'package:sih_23_audiometer/utils/routes.dart';

class StudentSignup extends StatefulWidget {
  const StudentSignup({super.key});

  @override
  State<StudentSignup> createState() => _StudentSignuptate();
}

class _StudentSignuptate extends State<StudentSignup> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formkey.currentState?.validate() ?? false) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.studentDashboard);
      setState(() {
        // var bool = changebutton = false;
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
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(children: [
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Enter username",
                    labelText: "username",
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "username can not be empty";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
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
                const SizedBox(
                  height: 20,
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changebutton ? 50 : 8),
                  child: InkWell(
                    onTap: () => moveToHome(context),
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changebutton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        // shape: changebutton?BoxShape.circle:BoxShape.rectangle,
                      ),
                      child: changebutton
                          ? const Icon(
                              Icons.done,
                              color: Colors.amber,
                            )
                          : const Text(
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