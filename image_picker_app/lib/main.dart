import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Image Picker",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedImage;


  Future selectImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    //print(image!.path);
    setState(() {
      pickedImage=image;
    });
  }

  Future CaptureImage() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      pickedImage = photo;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            pickedImage==null?
            Container(
              height: 300,
              width: width,
              color: Colors.blue,
              alignment: Alignment.center,
              child:
                   Text(
                     "No Image",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )

            ):
            Container(
                height: 300,
                width: width,
                color: Colors.blue,
                alignment: Alignment.center,
                child:
                Image.file(File(pickedImage!.path))
            )
            ,
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => CaptureImage(),
                  child: Icon(Icons.camera),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                    onPressed: () => selectImage(),
                    child: Icon(
                      Icons.collections_outlined,
                    ))
              ],
            ),
            SizedBox(height: 20,),
          ],

        ),

      ),
    );
  }
}
