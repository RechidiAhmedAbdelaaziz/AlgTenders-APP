import 'package:flutter/material.dart';

class LoginDTO {
  final TextEditingController login;
  final TextEditingController password;

  LoginDTO()
    : login = TextEditingController(),
      password = TextEditingController();

  void dispose() {
    login.dispose();
    password.dispose();
  }

  Map<String, dynamic> toMap() {
    return {'login': login.text, 'password': password.text};
  }

  
}
