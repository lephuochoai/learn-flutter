import 'package:flutter/material.dart';

String? usernameValidator(value) {
  if (value.isEmpty) return 'Please enter the username';

  return null;
}

String? passwordValidator(value) {
  if (value.isEmpty) return 'Please enter the password';
  // if (value.toString().length < 8) return 'Password too short';
  // if (value.toString().length > 20) return 'Password too long';

  return null;
}

final usernameController = TextEditingController();
final passwordController = TextEditingController();
