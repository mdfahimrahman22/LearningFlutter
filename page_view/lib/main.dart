import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view/data.dart';
import 'package:page_view/myAlertDialog.dart';
import 'package:provider/provider.dart';

import 'mySliverAppbar.dart';
import 'setStateExample.dart';
import 'myProvider.dart';
import 'Page1.dart';
import 'Page2.dart';
import 'bottomSheet.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Data()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
          controller: pageController,
          children: <Widget>[
            MyAlertDialog()],
        ),
      ),
    );
  }
}
