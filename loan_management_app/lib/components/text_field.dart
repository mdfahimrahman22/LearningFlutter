import 'package:flutter/material.dart';
import 'package:loan_management_app/constants.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String hint;

  const CustomTextField({Key? key, required this.icon, required this.hint})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        children: [
          TextFormField(
            onChanged: (val) {},
            decoration: InputDecoration(
                prefixIcon: Icon(widget.icon, color: kPrimaryColor),
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
