import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/auth_request.dart';
import '../entities/auth_response.dart';

abstract class AuthRepositoryInterface {
  Future<Either<Failure, AuthResponse>> login(AuthRequest authRequest);
  Future<Either<Failure, AuthResponse>> register(AuthRequest authRequest);
  Future<void> logout();
}