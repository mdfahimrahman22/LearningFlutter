import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class mySliverAppbar extends StatefulWidget {
  const mySliverAppbar({Key? key}) : super(key: key);

  @override
  _mySliverAppbarState createState() => _mySliverAppbarState();
}

class _mySliverAppbarState extends State<mySliverAppbar> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight:200,
          backgroundColor: Colors.red,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Sliver Appbar"),
            
          ),
        ),
        SliverList(delegate: SliverChildListDelegate(
          <Widget>[
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
            addDetails("One","Subtitle One"),
          ]
        ))
      ],
    );
  }
}

Widget addDetails(String title,String subtitle){
  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    leading: CircleAvatar(
      child: Text(title[0]),
    ),
  );
}
