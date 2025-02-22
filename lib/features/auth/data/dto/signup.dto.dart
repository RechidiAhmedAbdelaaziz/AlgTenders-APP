import 'package:flutter/material.dart';

class SignupDTO {
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phone;
  final TextEditingController password;
  final TextEditingController confirmPassword;

  SignupDTO()
    : name = TextEditingController(),
      email = TextEditingController(),
      phone = TextEditingController(),
      password = TextEditingController(),
      confirmPassword = TextEditingController();

  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    confirmPassword.dispose();
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name.text,
      'email': email.text,
      'phone': phone.text,
      'password': password.text,
    };
  }
}
