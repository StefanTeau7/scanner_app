import 'package:flutter/material.dart';
import 'package:scanner_app/others/constants.dart';
import 'package:scanner_app/others/widgets.dart';

class NutritionTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: normalColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: normalColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  // bottomLeft:Radius.circular(20) ,
                  // bottomRight:Radius.circular(20) ,
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        height: 100.0,
                        child: Image.asset('images/logo.png',
                            fit: BoxFit.scaleDown),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: backgroundColor,
                // borderRadius: BorderRadius.only(
                //                   bottomLeft: Radius.circular(5),
                // bottomRight: Radius.circular(5),
                //   topLeft: Radius.circular(20),
                //   topRight: Radius.circular(20),
                // ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Daily Nutrition Tracker',
                    style: TextStyle(
                      fontFamily: myFont,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 400,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  // topLeft: Radius.circular(5),
                  // topRight: Radius.circular(5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      DetailBox(title: "Total",text1: "Calories",text2:"1234 cal"),
                      DetailBox(title: "Total",text1: "Sodium",text2:"120 g"),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      DetailBox(title: "Total",text1: "Sugar",text2:"24 g"),
                      DetailBox(title: "Total",text1: "Others",text2:"15 g"),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        print("saved to notes");
                      },
                      child: Text(
                        'Save My Report To Notes',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: myFont),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
