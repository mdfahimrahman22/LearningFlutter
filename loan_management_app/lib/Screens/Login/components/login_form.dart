import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loan_management_app/components/common_components.dart';
import 'package:loan_management_app/constants.dart';
import 'package:loan_management_app/services/form_validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool passVisible = false;
  String email = '';
  String password = '';
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
                child: RoundedButton(
                    text: "Sign In",
                    press: () async {
                      if (_formKey.currentState!.validate()) {
                        print(email);
                      }
                    })),
          ],
        ),
      ),
    );
  }
}
