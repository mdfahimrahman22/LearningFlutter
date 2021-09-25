import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loan_management_app/Screens/Login/login_screen.dart';
import 'package:loan_management_app/Screens/Signup/signup_screen.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'constants.dart';
import 'package:loan_management_app/Screens/Home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iLoan App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: firebaseUser == null ? const WelcomeScreen() : const HomeScreen(),
      home: const HomeScreen(),
    );
  }
}
