import 'package:tender_app/core/di/locator.dart';
import 'package:tender_app/core/network/models/api_response.model.dart';
import 'package:tender_app/core/network/repo_base.dart';
import 'package:tender_app/features/auth/data/dto/login.dto.dart';
import 'package:tender_app/features/auth/data/dto/reset_password.dto.dart';
import 'package:tender_app/features/auth/data/dto/signup.dto.dart';
import 'package:tender_app/features/auth/data/source/auth.api.dart';

class AuthRepo extends NetworkRepository {
  final _api = locator<AuthApi>();

  RepoResult<AuthTokens> login(LoginDTO dto) => tryApiCall(() async {
    final response = await _api.login(dto.toMap());
    return response.tokens!;
  });

  RepoResult<AuthTokens> register(SignupDTO dto) =>
      tryApiCall(() async {
        final response = await _api.register(dto.toMap());
        return response.tokens!;
      });

  RepoResult<void> forgotPassword(ForgetPasswordDTO dto) =>
      tryApiCall(() async => await _api.forgotPassword(dto.toMap()));

  RepoResult<void> checkResetCode(CheckResetCodeDTO dto) =>
      tryApiCall(() async => await _api.checkResetCode(dto.toMap()));

  RepoResult<AuthTokens> resetPassword(ResetPasswordDTO dto) =>
      tryApiCall(() async {
        final response = await _api.resetPassword(dto.toMap());
        return response.tokens!;
      });

  RepoResult<AuthTokens> refreshToken(String refreshToken) =>
      tryApiCall(() async {
        final response = await _api.refreshToken(refreshToken);
        return response.tokens!;
      });
}
