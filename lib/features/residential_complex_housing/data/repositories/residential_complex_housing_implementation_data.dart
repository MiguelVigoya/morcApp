import 'package:clean_morc/features/residential_complex_housing/residential_complex_housing_entities.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/residential_complex_housing_repository_interface.dart';
import '../data_sources/residential_complex_housing_remote_data_source_from_api.dart';
import '../../../../core/common/utils/app_preference.dart';
import '../../residential_complex_housing_models.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';



class ResidentialComplexHousingImplementationData implements ResidentialComplexHousingRepositoryInterface {

  final ResidentialComplexHousingRemoteDataSourceFromApi remoteDataSourceApi;
  final String _token = AppPreferences.tokenProfile;
  final String _role = AppPreferences.roleProfile;
  final int _id = AppPreferences.idProfile;

  ResidentialComplexHousingImplementationData({required this.remoteDataSourceApi});

  @override
  Future<Either<Failure, List<ResidentialComplexHousingModel>>> getResidentialComplexHousingList() async{
    try {
      final residentialComplexHousingList = await remoteDataSourceApi.getResidentialComplexHousingList(userToken: _token);
      return Right(residentialComplexHousingList);
    } on ServerException {
      return Left(ServerFailure());
    }
  }


  @override
  Future<Either<Failure, ResidentialComplexHousingModel>> createResidentialComplexHousing({
    required ResidentialComplexHousingEntity residentialComplexHousing,}) async {
//TODO: BACKEND::::: CÓMO IDENTIFICAS QUE EL ID SEA EXCLUSIVAMENTE DE ADMINISTRADOR Y NO DE SUPER ADMINISTRADOR?????

    print('ResidentialComplexHousingImplementationData residentialComplexHousing id: ${residentialComplexHousing.id}');
    print(' ResidentialComplexHousingImplementationDataresidentialComplexHousing subscription: ${residentialComplexHousing.subscription}');

    print(' ResidentialComplexHousingImplementationData residentialComplexHousing name: ${residentialComplexHousing.name}');
    print('ResidentialComplexHousingImplementationData residentialComplexHousing address: ${residentialComplexHousing.address}');
    print('ResidentialComplexHousingImplementationData residentialComplexHousing personIds: ${residentialComplexHousing.personIds}');

   try {
     final ResidentialComplexHousingModel residentialComplexHousingResponse = await remoteDataSourceApi.createResidentialComplexHousing(residentialComplexHousing: residentialComplexHousing, userToken: _token);
     return Right(residentialComplexHousingResponse);
   } on ServerException {
     return Left(ServerFailure());
   }
  }



}
