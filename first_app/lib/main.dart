import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage()
    );
  }
}
class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var sideMargin=3;
    var topMargin=2;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              title: Text("Home Page"),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: () {},
                )
              ]),
          body: ListView(
              children:<Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: height/topMargin,
                      width: width/sideMargin,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Container(
                      height: height/topMargin,
                      width: width/sideMargin,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      height: 10,
                      width: 10,
                    ),
                    Container(
                      height: height/topMargin,
                      width: width/sideMargin,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ]
          )),
    );
  }
}
 
