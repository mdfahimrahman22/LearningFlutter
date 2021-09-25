import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loan_management_app/Screens/Login/login_screen.dart';
import 'package:loan_management_app/Screens/Welcome/welcome_screen.dart';
import 'package:loan_management_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_management_app/components/common_components.dart';
import 'package:loan_management_app/models/user.dart';
import 'package:loan_management_app/services/auth.dart';
import 'package:loan_management_app/services/form_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final AuthService _auth = AuthService();
  bool passVisible = false;
  bool confirmPassVisible = false;
  bool agreementConfirmed = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();

  bool error = false;
  bool isLoading = false;
  String errorMsg = '';
  String name = '';
  String email = '';
  String phone = '';
  String pass = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return kPrimaryColor;
      }
      return kPrimaryColor;
    }

    OutlineInputBorder border = const OutlineInputBorder(
        borderSide: BorderSide(color: kPrimaryColor),
        borderRadius: BorderRadius.all(Radius.circular(35)));

    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            TextFormField(
                controller: _nameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  return FormValidator().validateName(val);
                },
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
                decoration:
                    textInputDecoration(Icons.person_outline_outlined, "Name")),
            const SizedBox(height: 20),
            TextFormField(
                controller: _emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  return FormValidator().validateEmail(val);
                },
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
                decoration: textInputDecoration(Icons.email_outlined, "Email")),
            const SizedBox(height: 20),
            TextFormField(
                controller: _phoneController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) {
                  return FormValidator().validatePhone(val);
                },
                onChanged: (val) {
                  setState(() {
                    phone = val;
                  });
                },
                decoration: textInputDecoration(
                    Icons.phone_iphone_outlined, "Mobile Number")),
            const SizedBox(height: 20),
            TextFormField(
              controller: _passController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                return FormValidator().validatePassword(val);
              },
              onChanged: (val) {
                setState(() {
                  pass = val;
                });
              },
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
            TextFormField(
              controller: _confirmPassController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                return FormValidator().validateConfirmPassword(val, pass);
              },
              obscureText: !confirmPassVisible,
              decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.lock_outlined, color: kPrimaryColor),
                  suffixIcon: IconButton(
                    icon: Icon(
                        confirmPassVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: kPrimaryColor),
                    onPressed: () {
                      setState(() {
                        confirmPassVisible = !confirmPassVisible;
                      });
                    },
                  ),
                  errorBorder: border,
                  focusedErrorBorder: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  hintText: "Confirm Password",
                  hintStyle: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: agreementConfirmed,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  onChanged: (bool? val) {
                    if (val != null) {
                      setState(() {
                        agreementConfirmed = val;
                        error = !agreementConfirmed;
                        if (error) {
                          errorMsg =
                              "You have to agree with our Privacy Policy and T&C";
                        }
                      });
                    }
                  },
                ),
                Expanded(
                  child: Text(
                    "I agree to instant loan Privacy Policy and T&C",
                    style: GoogleFonts.koHo(
                        textStyle: const TextStyle(
                            fontSize: 18, color: Colors.blueGrey)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: error,
                child: Text(
                  errorMsg,
                  style: GoogleFonts.koHo(
                      textStyle:
                          const TextStyle(fontSize: 18, color: Colors.red)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                child: isLoading
                    ? const SpinKitFoldingCube(
                        color: Colors.white,
                        size: 25,
                      )
                    : const Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  primary: const Color(0xff6C63FF),
                  shape: const StadiumBorder(),
                ),
                onPressed: () async {
                  if (!agreementConfirmed) {
                    setState(() {
                      error = true;
                      errorMsg =
                          "You have to agree with our Privacy Policy and T&C";
                    });
                    return;
                  }
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
                      _auth.registerWithEmailAndPassword(email, pass);

                  user.then((value) {
                    FirebaseFirestore.instance
                        .collection("users")
                        .doc(value!.uid)
                        .set({
                      "name": name,
                      "email": email,
                      "phone": phone,
                    }, SetOptions(merge: true)).then((value) {
                      setState(() {
                        isLoading = false;
                      });
                      _nameController.clear();
                      _emailController.clear();
                      _phoneController.clear();
                      _passController.clear();
                      _confirmPassController.clear();

                      Fluttertoast.showToast(
                          msg: "Sign Up Successful",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: kPrimaryColor,
                          textColor: Colors.white,
                          fontSize: 25.0);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    });
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
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

InputDecoration textInputDecoration(IconData icon, String hint) {
  OutlineInputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.all(Radius.circular(35)));
  return InputDecoration(
      prefixIcon: Icon(icon, color: kPrimaryColor),
      errorBorder: border,
      focusedErrorBorder: border,
      enabledBorder: border,
      focusedBorder: border,
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 14));
}
