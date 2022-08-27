import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stddata/Screens/login.dart';
import 'package:stddata/Screens/print.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'Screens/admition.dart';
import 'Screens/home.dart';
import 'Screens/signup.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        //home: LoginScreen(),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),//Admition(),// LoginScreen(),
          'signup': (context) => SignUp(),
          'home': (context) => Home(),
          'Print': (context) => print(),
          'Admition': (context) => Admition(),
        });
  }
}
