import 'package:dartz/dartz.dart';

import '../../../../core/common/utils/app_preference.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/person_repository_interface.dart';
import '../../person_models.dart';
import '../data_sources/data_persons_from_api.dart';

class PersonRepositoryImplementationData implements PersonRepositoryInterface {
  final String _token = AppPreferences.tokenProfile;
  final DataPersonsFromApi dataPersonsFromApi;

  PersonRepositoryImplementationData({required this.dataPersonsFromApi});

  @override
  Future<Either<Failure, List<UserModel>>> getAllHandleComplexHousing() async {
    // TODO: implement getAllHandleComplexHousing
    try{
      final handleComplexHousingList = await dataPersonsFromApi.getAllHandleComplexHousing(userToken: _token);
      return Right(handleComplexHousingList);
    } on ServerException {
      return Left(ServerFailure());
    }
    throw UnimplementedError();
  }

}