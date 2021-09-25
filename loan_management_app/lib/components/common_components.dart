import 'package:flutter/material.dart';
import 'package:loan_management_app/constants.dart';
import 'package:loan_management_app/Screens/Login/login_screen.dart';
import 'package:loan_management_app/Screens/Signup/signup_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? press;

  const RoundedButton({Key? key, required this.text, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        primary: const Color(0xff6C63FF),
        shape: const StadiumBorder(),
      ),
    );
  }
}

Widget loginRoute(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Already have an account?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Color(0xffa8a8a8)),
        ),
        GestureDetector(
            child: const Text("Login",
                style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor)),
            onTap: () {
              navigateToLogin(context);
            })
      ],
    ),
  );
}

void navigateToLogin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const LoginScreen();
      },
    ),
  );
}

Widget signUpRoute(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Color(0xffa8a8a8)),
        ),
        GestureDetector(
            child: const Text("Sign Up",
                style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    color: kPrimaryColor)),
            onTap: () {
              navigateToSignUp(context);
            })
      ],
    ),
  );
}

void navigateToSignUp(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const SignUpScreen();
      },
    ),
  );
}
