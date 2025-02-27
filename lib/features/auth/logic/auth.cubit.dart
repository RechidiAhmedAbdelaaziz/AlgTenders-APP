import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/core/network/models/api_response.model.dart';
import 'package:tender_app/core/services/dio/interceptors/dio_interceptors.dart';
import 'package:tender_app/core/types/cubitstate/error.state.dart';

import '../data/repository/auth.repo.dart';
import '../data/source/auth.cache.dart';

part 'auth.state.dart';

class AuthCubit extends Cubit<AuthState> {
  final _authRepo = locator<AuthRepo>();
  final _authCache = locator<AuthCache>();

  AuthCubit() : super(AuthState.initial());

  void checkAuth() async {
    final isAuth = await _authCache.isAuthenticated;
    isAuth
        ? emit(state._authenticated())
        : emit(state._unauthenticated());
  }

  void authenticate(AuthTokens tokens) async {
    emit(state._authenticated());
    await _authCache.setTokens(tokens);
    locator<Dio>().addAuthTokenInterceptor();
  }

  void refreshToken() async {
    emit(state._loading());

    final refreshToken = await _authCache.refreshToken;
    if (refreshToken == null) {
      logout();
      return;
    }

    final result = await _authRepo.refreshToken(refreshToken);
    result.when(
      success: (tokens) => authenticate(tokens),
      error: (error) => emit(state._error(error.message)),
    );
  }

  void logout() async {
    emit(state._unauthenticated());
    await _authCache.clearTokens();
    locator<Dio>().removeAuthTokenInterceptor();

    //TODO Go to login page
  }
}
