import 'package:flutter/material.dart';
import 'package:loan_management_app/constants.dart';
class PasswordField extends StatefulWidget {
  final String hint;

  const PasswordField({Key? key, required this.hint}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool passVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          TextField(
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
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                hintText: widget.hint,
                hintStyle: const TextStyle(fontSize: 14)),
          )
        ],
      ),
    );
  }
}
