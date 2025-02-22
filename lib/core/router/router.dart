// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tender_app/features/auth/config/auth.route.dart';
import 'package:tender_app/features/auth/logic/auth.cubit.dart';
import 'package:tender_app/features/auth/modules/login/view/screen/login.screen.dart';
import 'package:tender_app/features/home/config/home.route.dart';
import 'package:tender_app/features/tender/modules/tenders/view/tenders.screen.dart';

import '../di/locator.dart';

part 'route_base.dart';
part 'navigator_base.dart';

class AppRouter {
  final routerConfig = GoRouter(
    initialLocation: TendersScreen.route, 
    routes: _generateRoutes(),
    debugLogDiagnostics: true,
    redirect: _handelRedirect,
  );

  void to(AppNavigatorBase navigator) => navigator._to();
  void off(AppNavigatorBase navigator) => navigator._off();
  void offAll(AppNavigatorBase navigator) => navigator._offAll();

  static List<RouteBase> _generateRoutes() {
    final bases = <AppRouteBase>[
      AuthRoute.login(),
      AuthRoute.signup(),
      HomeRoute(),
    ];
    return bases.map((base) => base.route).toList();
  }

  static FutureOr<String?> _handelRedirect(context, state) {
    final authCubit = locator<AuthCubit>();
    if (authCubit.state.isAuthanticated) return null;
    return LoginScreen.route;
  }
}
