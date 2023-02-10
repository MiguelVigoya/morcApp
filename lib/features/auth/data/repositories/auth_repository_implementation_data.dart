import 'package:dartz/dartz.dart';

import '../../domain/repositories/auth_repository_interface.dart';
import '../data_sources/data_login_from_api.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../auth_entities.dart';


class AuthRepositoryImplementationData implements AuthRepositoryInterface {

  final DataLoginFromApi dataLoginFromApi;
  AuthRepositoryImplementationData({required this.dataLoginFromApi});

  @override
  Future<Either<Failure, AuthResponse>> login(AuthRequest loginRequest) async {
    try{
      final loginResponse = await dataLoginFromApi.login(loginRequest);
      return Right(loginResponse);
    }on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse>> register(AuthRequest loginRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

}
