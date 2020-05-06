import 'package:flutter/material.dart';
import 'package:scanner_app/others/constants.dart';

class AnonLogin extends StatelessWidget {
  const AnonLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                alignment: Alignment.center,
                child: Image.asset('images/logo.png'),
                height: 100.0,
              ),
            ),
            Text('')
          ],
        ),
      ),
    );
  }
}
