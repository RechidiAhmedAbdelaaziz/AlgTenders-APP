import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/core/types/cubitstate/error.state.dart';
import 'package:tender_app/features/auth/data/dto/signup.dto.dart';
import 'package:tender_app/features/auth/data/repository/auth.repo.dart';
import 'package:tender_app/features/auth/logic/auth.cubit.dart';

part 'signup.state.dart';

class SignupCubit extends Cubit<SignupState> {
  final _authRepo = locator<AuthRepo>();

  final _formKey = GlobalKey<FormState>();
  SignupCubit() : super(SignupState.initial());

  GlobalKey<FormState> get formKey => _formKey;

  void signup() async {
    if (!_formKey.currentState!.validate()) return;
    emit(state._loading());

    final result = await _authRepo.register(state.dto);

    result.when(
      success: (tokens) {
        locator<AuthCubit>().authenticate(tokens);
        emit(state._success());
      },
      error: (error) => emit(state._error(error.message)),
    );
  }
}
