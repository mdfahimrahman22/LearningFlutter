import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}

// Widget header() {
//   return Stack(
//     children: [
//       Container(
//         color: Colors.red,
//         height: 500,
//       )
//     ],
//   );
// }
