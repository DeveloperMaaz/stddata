import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stddata/Screens/home.dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget {

  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  TextEditingController emailControler=TextEditingController();
  TextEditingController PassControler=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 50.0,),

            Container(
              child: Center(

                child: Text('Login',style: TextStyle(
                  fontSize: 30.0,
                ),),
              ),
            ),

            SizedBox(height: 40.0,),
            Structure('Email',emailControler , false),
            SizedBox(height: 20,),

            Structure('Password',PassControler , true),
            SizedBox(height: 40,),
            Container(
              width: MediaQuery.of(context).size.width-200,
              height: 35.0,
              decoration: BoxDecoration( color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: InkWell(

                  child: Text('Login',
                  style: TextStyle(fontSize: 25.0),
                  ),
                  onTap: ()async{

                    try {
                      UserCredential userCredential =
                      await firebaseAuth.signInWithEmailAndPassword(
                          email: emailControler.text,
                          password: PassControler.text);
                      print(userCredential.user!.email);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => Home()),
                              (route) => false);
                    } catch (e) {
                      final snackbar = SnackBar(content: Text(e.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    };


                  },

                ),
              ),
            ),
            SizedBox(height: 20.0,),
             Row(
               children: [
                 SizedBox(width: 20.0,),
                 Text("if you do not have an account "),
                 SizedBox(width: 10.0,),
                 InkWell(
                   child: Text('SignUp',style: TextStyle(fontSize: 20.0),),
                   onTap: (){
                     Navigator.pushNamed(context,'signup');

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

Widget Structure(String label,TextEditingController controller,bool obscuretext){

  return Container(
    width: 250,
    height: 50.0,
    child: TextFormField(
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
          )
      ),
    ),
  );
}