import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login.dart';

class SignUp extends StatelessWidget {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  TextEditingController firstNameControler = TextEditingController();
  TextEditingController mailControler = TextEditingController();
  TextEditingController PasswordControler = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Container(
              child: Center(
                child: Text(
                  'SignUp',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
            Container(
              width: 250,
              height: 50.0,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email";
                  }
                  if (value.endsWith('.com')) ;
                },
                controller: firstNameControler,
                obscureText: false,
                style: TextStyle(color: Colors.white),
                decoration: Decor(),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Structure('Email', mailControler, false),
            SizedBox(
              height: 20,
            ),
            Structure('Password', PasswordControler, true),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 200,
              height: 35.0,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: InkWell(
                  child: Text(
                    'SignUp',
                    style: TextStyle(fontSize: 25.0),
                  ),
                  onTap: ()async {
                    try {
                      UserCredential userCredential =
                      await firebaseAuth.createUserWithEmailAndPassword(
                          email: mailControler.text,
                          password: PasswordControler.text);
                      print(userCredential.user!.email);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => LoginScreen()),
                              (route) => false);
                    } catch (e) {
                      final snackbar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    };

                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20.0,
                ),
                Text("if you Already have account"),
                SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onTap: () async {
                    Navigator.pushNamed(context, '/');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget Structure(
    String label, TextEditingController controller, bool obscuretext) {
  return Container(
    width: 250,
    height: 50.0,
    child: TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Email";
        }
         },
      controller: controller,
      obscureText: obscuretext,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 17.0,
            color: Colors.black54,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1.5,
              color: Colors.amber,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 1.0,
              color: Colors.grey,
            ),
          )),
    ),
  );
}

Decor() {
  return InputDecoration(
      labelText: "Name",
      labelStyle: TextStyle(
        fontSize: 17.0,
        color: Colors.black54,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          width: 1.5,
          color: Colors.amber,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          width: 1.0,
          color: Colors.grey,
        ),
      ));
}
