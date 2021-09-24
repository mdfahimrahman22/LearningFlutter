import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loan_management_app/components/common_components.dart';
import 'package:loan_management_app/Screens/Login/login_screen.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Center(
            child: SvgPicture.asset(
              "assets/images/personal_finance.svg",
              width: size.width * 0.7,
              height: size.height * 0.3,
            ),
          ),
          const SizedBox(height: 70),
          header(),
          const SizedBox(height: 30),
          description(),
          const SizedBox(height: 40),
          Hero(
            tag: 'button',
            child: RoundedButton(
              text: "Sign In",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LoginScreen();
                    },
                  ),
                );
              }
            ),
          ),
          const SizedBox(height: 30),
          signUpRoute(context),
          const SizedBox(height: 40),
        ],
      )),
    );
  }
}

ElevatedButton signInButton() {
  return ElevatedButton(
    onPressed: () {},
    child: const Text('Sign In'),
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      primary: const Color(0xff6C63FF),
      shape: const StadiumBorder(),
    ),
  );
}

Container description() {
  return Container(
    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
    child: const Text(
      "Instant Salaries is the only "
      "0% interest platform in Bangladesh for solving"
      "financial crises in case of emergency",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, color: Color(0xffa8a8a8)),
    ),
  );
}

Container header() {
  return Container(
    padding: const EdgeInsets.fromLTRB(0.5, 0, 0.5, 0),
    child: const Text(
      "Get Your Salary In Advance",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 25.0,
          color: Color(0xff6C63FF),
          fontWeight: FontWeight.bold // insert your font size here
          ),
    ),
  );
}
