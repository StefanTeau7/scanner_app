import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scanner_app/app_screens/main_screen.dart';
import 'package:scanner_app/register_screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
    MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseUser user;
  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    FirebaseUser _user = await _firebaseAuth.currentUser();
    setState(() {
      user = _user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        // home: user != null
        //     ? MainScreen(
        //         user: user,
        //       )
        //     : WelcomeScreen());
       home: WelcomeScreen(),
       debugShowCheckedModeBanner: false,
    );
  }
}
