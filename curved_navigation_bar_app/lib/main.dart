import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'page1.dart';
import 'page2.dart';
import 'page3.dart';
import 'page4.dart';

void main() {
  runApp(MyNavigatorApp());
}

class MyNavigatorApp extends StatefulWidget {
  const MyNavigatorApp({Key? key}) : super(key: key);

  @override
  _MyNavigatorAppState createState() => _MyNavigatorAppState();
}

class _MyNavigatorAppState extends State<MyNavigatorApp> {
  final pages = [
    Page1(),
    Page2(),
    Page3(),
    Page4(),
  ];
  var pageIndex=0;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 70,
          index: 0,
          color: Colors.white,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(microseconds: 700),
          items: [
            Icon(Icons.home),
            Icon(Icons.ac_unit),
            Icon(Icons.message),
            Icon(Icons.access_alarm),
          ],
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
        ),
        body: pages[pageIndex]
      ),
    );
  }
}
