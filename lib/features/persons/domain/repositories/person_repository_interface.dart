



import 'package:clean_morc/features/persons/person_models.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class PersonRepositoryInterface {
  //Future<Either<Failure, UserEntity>> getPerson(int id);
  Future<Either<Failure, List<UserModel>>> getAllHandleComplexHousing();
  //Future<Either<Failure, UserEntity>> createPerson(UserEntity user);
  //Future<Either<Failure, UserEntity>> updatePerson(UserEntity user);
  //Future<Either<Failure, void>> deletePerson(int id);
}