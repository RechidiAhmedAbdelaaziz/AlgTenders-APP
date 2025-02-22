import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tender_app/core/router/router.dart';
import 'package:tender_app/core/router/routes.dart';
import 'package:tender_app/features/auth/modules/login/logic/login.cubit.dart';
import 'package:tender_app/features/auth/modules/login/view/screen/login.screen.dart';
import 'package:tender_app/features/auth/modules/signup/logic/signup.cubit.dart';
import 'package:tender_app/features/auth/modules/signup/view/screen/signup.screen.dart';

class AuthRoute extends AppRouteBase {
  AuthRoute.login()
    : super(
        name: AppRoutes.login,
        path: LoginScreen.route,
        builder: _buildLoginScreen,
      );

  static Widget _buildLoginScreen(
    BuildContext context,
    GoRouterState state,
  ) =>
      BlocProvider(create: (_) => LoginCubit(), child: LoginScreen());

  AuthRoute.signup()
    : super(
        name: AppRoutes.signup,
        path: SignupScreen.route,
        builder: _buildSignupScreen,
      );

  static Widget _buildSignupScreen(
    BuildContext context,
    GoRouterState state,
  ) => BlocProvider(
    create: (_) => SignupCubit(),
    child: SignupScreen(),
  );
}
