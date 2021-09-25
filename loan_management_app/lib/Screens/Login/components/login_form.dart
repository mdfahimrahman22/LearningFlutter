import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loan_management_app/Screens/Home/home_screen.dart';
import 'package:loan_management_app/Screens/Login/login_screen.dart';
import 'package:loan_management_app/components/common_components.dart';
import 'package:loan_management_app/constants.dart';
import 'package:loan_management_app/models/user.dart';
import 'package:loan_management_app/services/auth.dart';
import 'package:loan_management_app/services/form_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthService _auth = AuthService();
  bool passVisible = false;
  String email = '';
  String password = '';
  bool isLoading = false;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  OutlineInputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.all(Radius.circular(35)));
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                return FormValidator().validateEmail(val);
              },
              onChanged: (val) => setState(() => email = val),
              decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.email_outlined, color: kPrimaryColor),
                  errorBorder: border,
                  focusedErrorBorder: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  hintText: "Email",
                  hintStyle: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 20),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                return FormValidator().validatePassword(val);
              },
              onChanged: (val) => setState(() => password = val),
              obscureText: !passVisible,
              decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.lock_outlined, color: kPrimaryColor),
                  suffixIcon: IconButton(
                    icon: Icon(
                        passVisible ? Icons.visibility : Icons.visibility_off,
                        color: kPrimaryColor),
                    onPressed: () {
                      setState(() {
                        passVisible = !passVisible;
                      });
                    },
                  ),
                  errorBorder: border,
                  focusedErrorBorder: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  hintText: "Password",
                  hintStyle: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 20),
            Hero(
                tag: 'button',
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    child: isLoading
                        ? const SpinKitFoldingCube(
                            color: Colors.white,
                            size: 25,
                          )
                        : const Text("Sign In"),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 18),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      primary: const Color(0xff6C63FF),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      if (isLoading) {
                        Fluttertoast.showToast(
                            msg: "Please Wait",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: kPrimaryColor,
                            textColor: Colors.white,
                            fontSize: 25.0);
                        return;
                      }
                      setState(() {
                        isLoading = true;
                      });
                      Future<AppUser?> user =
                          _auth.signInWithEmailAndPassword(email, password);

                      user.then((value) {
                        setState(() {
                          isLoading = false;
                        });
                        Fluttertoast.showToast(
                            msg: 'Welcome Back',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: kPrimaryColor,
                            textColor: Colors.white,
                            fontSize: 25.0);
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomeScreen(),
                          ),
                          (route) => false,
                        );
                      }).catchError((err) {
                        setState(() {
                          isLoading = false;
                        });
                        print(err);
                        Fluttertoast.showToast(
                            msg: 'Error occured, $err',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: kPrimaryColor,
                            textColor: Colors.white,
                            fontSize: 25.0);
                      });
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
