import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Homepage());
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var sideMargin = 3;
    var topMargin = 2;
    final pages = [
      Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft:Radius.circular(50))
        ),
        child: Container(
          height: 200,
          width: 200,
        ),
        color: Colors.blueAccent,
      ),
      Container(
        color: Colors.redAccent,
      ),
      Container(
        color: Colors.blueAccent,
      ),
      Container(
        color: Colors.amberAccent,
      ),
    ];
    return SafeArea(
        child: Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar:
          AppBar(title: Text("Home Page"), centerTitle: true, actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add_a_photo),
          onPressed: () {},
        )
      ]),
      body: Center(
          child: pages[0]

      ),
    ));
  }
}
