import 'package:tender_app/core/extension/localization.extension.dart';
import 'package:tender_app/core/localization/page_strings.dart';

class LoginStrings extends PageStrings {
  LoginStrings(super.context);

  String get email => 'Email'.tr(context);
  String get password => 'Password'.tr(context);
  String get rememberMe => 'Remember me'.tr(context);
  String get forgotPassword => 'Forgot password?'.tr(context);
  String get login => 'Login'.tr(context);
  String get createAnAccount => 'Create an account'.tr(context);

  String get invalidEmail => 'Invalid email'.tr(context); 
  String get invalidPassword => 'Invalid password'.tr(context);
}
