import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view/data.dart';
import 'package:page_view/receiveDataPage.dart';
import 'package:provider/provider.dart';

class myProvider extends StatefulWidget {
  const myProvider({Key? key}) : super(key: key);

  @override
  _myProviderState createState() => _myProviderState();
}

class _myProviderState extends State<myProvider> {
  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Data>(context);
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              providerData.value.toString(),
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                providerData.Increment();
              },
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context)=>receiveDataPage()));

              },
              child: Text('Goto Receive Data Page'),
            ),
          ],
        ),
      ),
    ));
  }
}
