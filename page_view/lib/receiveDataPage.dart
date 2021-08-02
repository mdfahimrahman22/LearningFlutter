import 'package:flutter/material.dart';
import 'package:page_view/data.dart';
import 'package:provider/provider.dart';

class receiveDataPage extends StatelessWidget {
  const receiveDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerData=Provider.of<Data>(context);
    return Scaffold(
      body: Center(
        child: Text(providerData.value.toString()),
      ),
    );
  }
}
