import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scanner_app/app_screens/bookmarked_items_screen.dart';
import 'package:scanner_app/app_screens/item_info_screen.dart';
import 'package:scanner_app/app_screens/search_item.dart';
import 'package:scanner_app/app_screens/tracker_screen.dart';
import 'package:scanner_app/others/constants.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:scanner_app/others/widgets.dart';

class MainScreen extends StatefulWidget {
  // final FirebaseUser user;

  // MainScreen({Key key, this.user})
  //     : assert(user != null),
  //       super(key: key);

    MainScreen({Key key, })
      : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String result = "Hey there !";

// -------- USER INTERFACE  ---------\
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: normalColor,
      bottomNavigationBar: BottomAppBar(
          elevation: 20,
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                color: normalColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchItem()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark),
                color: normalColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookMarkedItem()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.track_changes),
                color: normalColor,
                                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NutritionTracker()),
                  );
                },
              ),
            ],
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
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
                      child:
                          Image.asset('images/logo.png', fit: BoxFit.scaleDown),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: ListView(
              children: <Widget>[
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Recently Scanned Items \n',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: myFont,
                          fontSize: 20),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductInfo()),
                          );
                        },
                        child: Text(
                          'M&M box - 120cal',
                          style: TextStyle(
                              color: Colors.white, fontFamily: myFont),
                        )),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'Water - 0 cal',
                      style: TextStyle(color: Colors.white, fontFamily: myFont),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'Kit Kat - 220 cal',
                      style: TextStyle(color: Colors.white, fontFamily: myFont),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'Pringles - 460 cal',
                      style: TextStyle(color: Colors.white, fontFamily: myFont),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'Backwoods - 420 cal',
                      style: TextStyle(color: Colors.white, fontFamily: myFont),
                    ),
                    Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'Sprite - 220 cal',
                      style: TextStyle(color: Colors.white, fontFamily: myFont),
                    ),
                                        Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'Durex - 0 cal',
                      style: TextStyle(color: Colors.white, fontFamily: myFont),
                    ),

                  ],
                )
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('images/barcode.png'))),
                  ),
                  RoundedButton(
                      title: 'Scan', colour: backgroundColor, onPressed: _scanQR),
                ],
              )),
        ],
      ),
    );
  }

  Future _scanQR() async {
    try {
      ScanResult qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult as String;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }
}
