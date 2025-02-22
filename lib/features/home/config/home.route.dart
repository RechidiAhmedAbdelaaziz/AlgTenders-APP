import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tender_app/core/router/router.dart';
import 'package:tender_app/core/router/routes.dart';
import 'package:tender_app/features/home/view/home.screen.dart';

class HomeRoute extends AppRouteBase {
  HomeRoute() : super(path: HomeScreen.route, name: AppRoutes.home);

  Widget _homePageBuilder(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) {
    return HomeScreen(child: child);
  }

  @override
  RouteBase get route =>
      ShellRoute(builder: _homePageBuilder, routes: _buildRoutes());

  List<RouteBase> _buildRoutes() {
    return <AppRouteBase>[].map((e) => e.route).toList();
  }
}
