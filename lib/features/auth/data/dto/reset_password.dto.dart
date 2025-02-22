import 'package:flutter/material.dart';
import 'package:tender_app/core/extension/map.extension.dart';

class ForgetPasswordDTO {
  final email = TextEditingController();

  void dispose() {
    email.dispose();
  }

  Map<String, dynamic> toMap() {
    return {'email': email.text};
  }
}

class CheckResetCodeDTO extends ForgetPasswordDTO {
  final code = TextEditingController();

  @override
  void dispose() {
    code.dispose();
    super.dispose();
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      ...super.toMap(),
      'otp': int.tryParse(code.text),
    }.withoutNullsOrEmpty();
  }
}

class ResetPasswordDTO extends CheckResetCodeDTO {
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  void dispose() {
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Map<String, dynamic> toMap() {
    return {...super.toMap(), 'password': password.text};
  }
}
