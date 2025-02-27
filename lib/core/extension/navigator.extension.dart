import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tender_app/core/router/router.dart';

extension NavigatorExtension on BuildContext {
  void to(AppNavigatorBase route) => pushNamed(
    route.name,
    pathParameters: route.pathParams,
    queryParameters: route.queryParams,
  );

  Future<void> toWith<T>(
    AppNavigatorBase route, {
    required ValueChanged<T> onResult,
    VoidCallback? onError,
  }) async {
    final result = await pushNamed<T>(
      route.name,
      pathParameters: route.pathParams,
      queryParameters: route.queryParams,
    );
    result != null ? onResult(result) : onError?.call();
  }

  void off(AppNavigatorBase route) =>
    pushReplacementNamed(
      route.name,
      pathParameters: route.pathParams,
      queryParameters: route.queryParams,
    );
  

  void offAll(AppNavigatorBase route) {
    goNamed(
      route.name,
      pathParameters: route.pathParams,
      queryParameters: route.queryParams,
    );
  }

  void back<T>([T? result]) => Navigator.of(this).pop(result);
}
