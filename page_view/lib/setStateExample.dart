import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class setStateExample extends StatefulWidget {
  const setStateExample({Key? key}) : super(key: key);

  @override
  _setStateExampleState createState() => _setStateExampleState();
}

class _setStateExampleState extends State<setStateExample> {
  int value = 0;

  Increment() {
    setState(() {
      value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value.toString(), style: TextStyle(fontSize: 25),),
            ElevatedButton(
              onPressed: () {
                Increment();
              },
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    ));
  }
}
