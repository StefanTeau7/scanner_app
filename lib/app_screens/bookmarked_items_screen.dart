import 'package:flutter/material.dart';
import 'package:scanner_app/app_screens/item_info_screen.dart';
import 'package:scanner_app/others/constants.dart';

class BookMarkedItem extends StatefulWidget {
  @override
  _BookMarkedItemState createState() => _BookMarkedItemState();
}

class _BookMarkedItemState extends State<BookMarkedItem> {
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
                    'Bookmarked Items',
                    style: TextStyle(
                      fontFamily: myFont,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Click on item to view details',
                    style: TextStyle(
                      fontFamily: myFont,
                      fontSize: 15,
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
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  // topLeft: Radius.circular(5),
                  // topRight: Radius.circular(5),
                ),
              ),
              child: ListView(
                children: <Widget>[
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductInfo()),
                            );
                          },
                          child: Text(
                            'M&M box - 120 cal',
                            style: TextStyle(
                                color: Colors.white, fontFamily: myFont),
                          )),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1,
                      ),
                      Text(
                        'Water - 0 cal',
                        style:
                            TextStyle(color: Colors.white, fontFamily: myFont),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1,
                      ),
                      Text(
                        'Kit Kat - 220 cal',
                        style:
                            TextStyle(color: Colors.white, fontFamily: myFont),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1,
                      ),
                      Text(
                        'Pringles - 460 cal',
                        style:
                            TextStyle(color: Colors.white, fontFamily: myFont),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1,
                      ),
                      Text(
                        'Backwoods - 420 cal',
                        style:
                            TextStyle(color: Colors.white, fontFamily: myFont),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1,
                      ),
                      Text(
                        'Sprite - 220 cal',
                        style:
                            TextStyle(color: Colors.white, fontFamily: myFont),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1,
                      ),
                      Text(
                        'Bounty - 220 cal',
                        style:
                            TextStyle(color: Colors.white, fontFamily: myFont),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1,
                      ),
                      Text(
                        'Snickers - 220 cal',
                        style:
                            TextStyle(color: Colors.white, fontFamily: myFont),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1,
                      ),
                      Text(
                        'Something - 69 cal',
                        style:
                            TextStyle(color: Colors.white, fontFamily: myFont),
                      ),
                                                                                  Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'Lol - 550 cal',
                      style: TextStyle(color: Colors.white, fontFamily: myFont),
                    ),
                                                                                Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'I ran out of ideas - 24 cal',
                      style: TextStyle(color: Colors.white, fontFamily: myFont),
                    ),
                                                                                Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'Something else - 250 cal',
                      style: TextStyle(color: Colors.white, fontFamily: myFont),
                    ),
                                                                                Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'McDonalds - 2200 cal',
                      style: TextStyle(color: Colors.white, fontFamily: myFont),
                    ),
                                                                                Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'Bruh - 9999 cal',
                      style: TextStyle(color: Colors.white, fontFamily: myFont),
                    ),
                                                                                Divider(
                      color: Colors.white,
                      thickness: 0.1,
                    ),
                    Text(
                      'Veggies - 1 cal',
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
          ],
        ),
      ),
    );
  }
}
