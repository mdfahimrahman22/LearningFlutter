import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyAlertDialog extends StatefulWidget {
  const MyAlertDialog({Key? key}) : super(key: key);

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: ElevatedButton(
        onPressed: () => {
          showDialog(
              context: context,
              builder: (context) {
                return showAlertDialog(
                    context, "Alert", "This is a simple alert dialog");
              })
        },
        child: Text("showAlertDialog"),
      )),
    );
  }
}

Widget showAlertDialog(BuildContext context, String title, String subtitle) {
  return AlertDialog(
    title: Text(title),
    content: Text(subtitle),
    actions: [
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("OK"))
    ],
  );
}
