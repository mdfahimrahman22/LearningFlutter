class FormValidator {
  static FormValidator? _instance;

  factory FormValidator() => _instance ??= FormValidator._();

  FormValidator._();

  String? validatePassword(String? value) {
    String patttern =
        r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z!@#$%^&*.,:><|_;\d]{6,}$)';
    RegExp regExp = RegExp(patttern);
    if (value!.isEmpty) {
      return "Password is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Password must have at least 6 characters,\nOne uppercase letter, One lowercase letter\n& One number";
    }
    return null;
  }

  String? validateConfirmPassword(String? value, String? pass) {
    if (value != pass) {
      return "Confirm Password is not matching";
    }
    return null;
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Name is Required";
    }
    return null;
  }

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String? validatePhone(String? value) {
    if (value!.isEmpty) {
      return "Phone is Required";
    } else if (value.length < 11) {
      return "Invalid Phone";
    } else {
      return null;
    }
  }
}
