import 'package:email_validator/email_validator.dart';

class Utils {
  static bool isPasswordCompliant(String? password, [int minLength = 7]) {
    if (password == null || password.isEmpty) {
      return false;
    }

    bool hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length > minLength;

    return hasDigits &
        hasUppercase &
        hasLowercase &
        hasSpecialCharacters &
        hasMinLength;
  }

  static isEmailValid(String email) {
    return EmailValidator.validate(email);
  }

  static isEmailPasswordValid(String email, String password) {
    return isEmailValid(email) && isPasswordCompliant(password);
  }
}