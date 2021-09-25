import 'package:flutter/material.dart';
import 'package:loan_management_app/Screens/Signup/components/signup_form.dart';
import 'package:loan_management_app/components/loading.dart';
import 'package:loan_management_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_management_app/components/header_welcome.dart';
import 'package:loan_management_app/components/common_components.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      slivers: <Widget>[
        SliverAppBar(
            stretch: true,
            onStretchTrigger: () {
              // Function callback for stretch
              return Future<void>.value();
            },
            expandedHeight: 300.0,
            backgroundColor: kPrimaryColor,
            flexibleSpace: header("assets/images/signup_background.jpg")),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Hero(
                      tag: 'title',
                      transitionOnUserGestures: true,
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text("Sign Up to continue",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lobster(
                              textStyle: const TextStyle(fontSize: 25),
                            )),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SignupForm(),
                    const SizedBox(height: 30),
                    loginRoute(context),
                    const SizedBox(height: 50),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
