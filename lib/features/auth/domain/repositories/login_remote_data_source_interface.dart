

import 'package:clean_morc/features/auth/auth_models.dart';
import '../entities/auth_request.dart';

abstract class LoginRemoteDataSourceInterface {
  /// Calls the https://dev1.api.housing-complex.tk/auth/login endpoint.
  ///
  ///Trows [ServerException] for all error codes.
  Future<AuthResponseModel> login(AuthRequest loginRequest);

  /// Calls the https://dev1.api.housing-complex.tk/auth/register endpoint.
  ///
  /// Trows [ServerException] for all error codes.
  Future<AuthResponseModel> register(AuthRequest loginRequest);
}