import 'package:flutter/foundation.dart';
import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/features/auth/data/repository/auth.repo.dart';
import 'package:tender_app/features/auth/data/source/auth.api.dart';
import 'package:tender_app/features/auth/data/source/auth.cache.dart';
import 'package:tender_app/features/auth/logic/auth.cubit.dart';

class AuthDependency extends FeaturesDependency {
  @override
  void init() {
    locator.registerLazySingleton<AuthApi>(() => AuthApi(locator()));

    locator.registerLazySingleton<AuthCache>(
      () => kIsWeb ? WebAuthCache() : SecureAuthCache(),
    );

    locator.registerLazySingleton<AuthRepo>(() => AuthRepo());

    locator.registerSingleton<AuthCubit>(AuthCubit()..checkAuth());
  }
}
