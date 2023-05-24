import 'package:api_service/api_service.dart';
import 'package:dartz/dartz.dart';


class AuthenticationRepositoryImpl {
  AuthenticationRepositoryImpl({
    required ApiService apiService,
  }) : _apiService = apiService;

  final ApiService _apiService;

  Future<Either<Exception, UserModel>> login({
    required String email,
    required String password,
  }) async =>
      await _apiService.login(
        email: email,
        password: password,
      );

  Future<Either<Exception, PasswordResetModel>> forgotPassword({
    required String email,
  }) async =>
      await _apiService.forgotPassword(
        email: email,
      );

  Future<Either<Exception, PasswordResetModel>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async =>
      await _apiService.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
}
