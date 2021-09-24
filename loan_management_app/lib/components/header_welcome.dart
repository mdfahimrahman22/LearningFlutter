import 'package:flutter/material.dart';

Widget header(String backgroundImg) {
  return FlexibleSpaceBar(
    stretchModes: const <StretchMode>[
      StretchMode.zoomBackground,
      StretchMode.blurBackground,
    ],
    centerTitle: true,
    title: const Text(
      'Welcome to iLoan Family',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
    background: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          backgroundImg,
          fit: BoxFit.cover,
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, 0.5),
              end: Alignment.center,
              colors: <Color>[
                Color(0x60000000),
                Color(0x00000000),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
