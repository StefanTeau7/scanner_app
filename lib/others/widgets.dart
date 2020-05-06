import 'package:flutter/material.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:scanner_app/others/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DetailBox extends StatelessWidget {
  DetailBox({
    this.title,
    this.text1,
    this.text2,
  });
  final String title;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        elevation: 5.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: DottedBorder(
            padding: EdgeInsets.all(2),
            strokeCap: StrokeCap.square,
            color: Colors.white,
            child: Container(
                padding: EdgeInsets.symmetric(),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                width: 175,
                height: 175,
                alignment: Alignment.center,
                child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: myFont,
                          fontSize:20),
                    ),
                    Text(
                      text1,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: myFont,
                          fontSize: 20),
                    ),
                    Text(
                      text2,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: myFont,
                          fontSize: 20),
                    ),
                  ],
                )),
          ),
        ));
  }
}

//ROUNDED BUTTON Widget
class RoundedButton extends StatelessWidget {
  RoundedButton({
    this.width,
    this.title,
    this.colour,
    @required this.onPressed,
  });
  final double width;
  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class User {
  final String uid;

  User({this.uid});
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password

  // register with email and password

  // sign out

}
