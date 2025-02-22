import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/core/network/models/api_response.model.dart';
import 'package:tender_app/core/types/cubitstate/error.state.dart';
import 'package:tender_app/features/auth/data/dto/login.dto.dart';
import 'package:tender_app/features/auth/data/repository/auth.repo.dart';
import 'package:tender_app/features/auth/logic/auth.cubit.dart';

part 'login.state.dart';

class LoginCubit extends Cubit<LoginState> {
  final _authRepo = locator<AuthRepo>();

  final _formKey = GlobalKey<FormState>();

  LoginCubit() : super(LoginState.initial());

  GlobalKey<FormState> get formKey => _formKey;

  void login() async {
    if (!_formKey.currentState!.validate()) return;

    emit(state._loading());

    final result = await _authRepo.login(state.loginDTO);
    result.when(
      success: (tokens) {
        locator<AuthCubit>().authenticate(tokens);
        emit(state._success(tokens));
      },
      error: (error) => emit(state._error(error.message)),
    );
  }

  @override
  Future<void> close() {
    state.loginDTO.dispose();

    return super.close();
  }
}
