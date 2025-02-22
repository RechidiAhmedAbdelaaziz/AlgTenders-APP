// ignore_for_file: library_private_types_in_public_api

part of 'signup.cubit.dart';

enum _SignupStatus { initial, loading, success, error }

class SignupState extends ErrorState {
  final SignupDTO _signupDTO;
  final _SignupStatus _status;

  SignupState({
    required SignupDTO signupDTO,
    _SignupStatus status = _SignupStatus.initial,
    String? error,
  }) : _signupDTO = signupDTO,
       _status = status,
       super(error);

  factory SignupState.initial() =>
      SignupState(signupDTO: SignupDTO());

  SignupDTO get dto => _signupDTO;
  bool get isLoading => _status == _SignupStatus.loading;

  SignupState _loading() => _copyWith(status: _SignupStatus.loading);

  SignupState _success() => _copyWith(status: _SignupStatus.success);

  SignupState _error(String error) =>
      _copyWith(status: _SignupStatus.error, error: error);

  SignupState _copyWith({
    SignupDTO? signupDTO,
    _SignupStatus? status,
    String? error,
  }) {
    return SignupState(
      signupDTO: signupDTO ?? _signupDTO,
      status: status ?? _status,
      error: error,
    );
  }
}
