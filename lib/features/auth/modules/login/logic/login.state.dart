// ignore_for_file: library_private_types_in_public_api

part of 'login.cubit.dart';

enum _LoginStatus { initial, loading, success, error }

class LoginState extends ErrorState {
  final LoginDTO loginDTO;
  final _LoginStatus _status;

  LoginState({
    required this.loginDTO,
    _LoginStatus status = _LoginStatus.initial,
    String? error,
  }) : _status = status,
       super(error);

  factory LoginState.initial() => LoginState(loginDTO: LoginDTO());

  bool get isLoading => _status == _LoginStatus.loading;

  LoginState _loading() => _copyWith(status: _LoginStatus.loading);

  LoginState _success(AuthTokens tokens) =>
      _SavedState(tokens, loginDTO);

  LoginState _error(String error) =>
      _copyWith(status: _LoginStatus.error, error: error);

  LoginState _copyWith({
    LoginDTO? loginDTO,
    _LoginStatus? status,
    String? error,
  }) {
    return LoginState(
      loginDTO: loginDTO ?? this.loginDTO,
      status: status ?? _status,
      error: error,
    );
  }

  void onSave(ValueChanged<AuthTokens> callback) {}
}

class _SavedState extends LoginState {
  final AuthTokens tokens;

  _SavedState(this.tokens, LoginDTO dto)
    : super(loginDTO: dto, status: _LoginStatus.success);

  @override
  void onSave(ValueChanged<AuthTokens> callback) => callback(tokens);
}
