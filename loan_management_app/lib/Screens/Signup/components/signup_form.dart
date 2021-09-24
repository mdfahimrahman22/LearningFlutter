import 'package:flutter/material.dart';
import 'package:loan_management_app/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loan_management_app/components/common_components.dart';
import 'package:loan_management_app/services/auth.dart';
import 'package:loan_management_app/services/form_validator.dart';

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
  String name = '';
  String email = '';
  String phone = '';
  String pass = '';
  final _formKey = GlobalKey<FormState>();
  OutlineInputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(color: kPrimaryColor),
      borderRadius: BorderRadius.all(Radius.circular(35)));
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

    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                return FormValidator().validateName(val);
              },
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person_outline_outlined,
                      color: kPrimaryColor),
                  errorBorder: border,
                  focusedErrorBorder: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  hintText: "Name",
                  hintStyle: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 20),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                return FormValidator().validateEmail(val);
              },
              onChanged: (val) {
                setState(() {
                  email = val;
                });
              },
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
                return FormValidator().validatePhone(val);
              },
              onChanged: (val) {
                setState(() {
                  phone = val;
                });
              },
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.phone_iphone_outlined,
                      color: kPrimaryColor),
                  errorBorder: border,
                  focusedErrorBorder: border,
                  enabledBorder: border,
                  focusedBorder: border,
                  hintText: "Mobile Number",
                  hintStyle: const TextStyle(fontSize: 14)),
            ),
            const SizedBox(height: 20),
            TextFormField(
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
                visible: !agreementConfirmed,
                child: Text(
                  "You have to agree with our Privacy Policy and T&C",
                  style: GoogleFonts.koHo(
                      textStyle:
                          const TextStyle(fontSize: 18, color: Colors.red)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            RoundedButton(
              text: "Sign Up",
              press: () async {
                if (_formKey.currentState!.validate() && agreementConfirmed) {
                  dynamic result =
                      _auth.registerWithEmailAndPassword(email, pass);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
