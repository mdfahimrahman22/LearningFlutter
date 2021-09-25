import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/navbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawerEnableOpenDragGesture: true,
      drawerEdgeDragWidth: 200,
      endDrawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Body(),
    );
  }
}
