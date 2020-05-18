import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:scanner_app/app_screens/main_screen.dart';
import 'package:scanner_app/others/constants.dart';
import 'package:scanner_app/others/widgets.dart';
import 'package:scanner_app/register_screens/login_screen_email.dart';
import 'package:scanner_app/register_screens/register_screen_email.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
        final AuthService _auth = AuthService();
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
            ColorizeAnimatedTextKit(
              alignment: Alignment.center,
              text: ['Scazy'],
              textStyle: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
              ),
              colors: [
                Colors.green,
                Colors.purple,
                Colors.blue,
                Colors.yellow,
                Colors.red,
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: normalColor,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: secondColor,
              onPressed: () {
                                                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
              },
            ),
            Text("--- or ---",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: myFont,
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
        RoundedButton(
                  title: 'Enter app anonymously',
                  colour: secondColor,
                 onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if(result == null){
              print('error signing in');
            } else {
              print('signed in');
              print(result.uid);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                  );
              //MaterialPageRoute(builder: (context) => MainScreen(user:result));
            }
          },
                ),
                Text("Warning! \n Saved items may be lost without an account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontFamily: myFont,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
