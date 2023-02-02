import 'package:dartz/dartz.dart';
import 'package:clean_morc/core/error/failures.dart';
import '../../auth_entities.dart';
import '../repositories/auth_repository_interface.dart';

class Login {
  final AuthRepositoryInterface loginRepository;

  Login(this.loginRepository);

  Future<Either<Failure, AuthResponse>> call({required AuthRequest loginRequest}) async {
    return await loginRepository.login(loginRequest);
  }
}
