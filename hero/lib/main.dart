import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'One.dart';
import 'Second.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final pages = [One(), Second()];
  var cIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cIndex,
          backgroundColor: Colors.blueAccent,
          selectedItemColor: Colors.white30,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.message), title: Text("Message")),
            BottomNavigationBarItem(
                icon: Icon(Icons.call), title: Text("Call")),
          ],
          onTap: (index) {
            setState(() {
              cIndex = index;
            });
          },
        ),
        body: pages[cIndex]);
  }
}
