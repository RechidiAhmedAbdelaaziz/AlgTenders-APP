import 'package:tender_app/core/router/router.dart';
import 'package:tender_app/core/router/routes.dart';

class AuthNavigator extends AppNavigatorBase {
  AuthNavigator.login() : super(name: AppRoutes.login);

  AuthNavigator.signup() : super(name: AppRoutes.signup);
}
