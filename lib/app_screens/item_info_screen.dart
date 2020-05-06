import 'package:flutter/material.dart';
import 'package:scanner_app/app_screens/item_location.dart';
import 'package:scanner_app/others/constants.dart';
import 'package:scanner_app/others/widgets.dart';

class ProductInfo extends StatefulWidget {
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: normalColor,
      bottomNavigationBar: BottomAppBar(
          elevation: 20,
          color: secondColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Add to..."),
                  IconButton(
                    icon: Icon(Icons.bookmark),
                    color: backgroundColor,
                    onPressed: () {},
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Add to..."),
                  IconButton(
                    icon: Icon(Icons.track_changes),
                    color: backgroundColor,
                    onPressed: () {},
                  ),
                ],
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
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
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
                      child: Image.asset('images/logo.png', fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                                       crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                                       crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                '  General Product   \n              Info:   ',
                                style: TextStyle(
                                  fontFamily: myFont,
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Name, Company, Distributor',
                                style: TextStyle(
                                  fontFamily: myFont,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 150,
                            child: Image.asset('images/product.png',
                                fit: BoxFit.contain),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(thickness: 0.1, color: Colors.white),
                  Container(

                            child: Image.asset('images/table.png',
                                fit: BoxFit.fill),
                  ),
                  RoundedButton(
                    title: 'Find Product Availability',
                    colour: secondColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ItemLocation()),
                      );
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
