

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../residential_complex_housing_models.dart';

abstract class ResidentialComplexHousingRepositoryInterface {
  Future<Either<Failure, List<ResidentialComplexHousingModel>>> getResidentialComplexHousingList();
  Future<Either<Failure, ResidentialComplexHousingModel>> createResidentialComplexHousing({required ResidentialComplexHousingModel residentialComplexHousing});

  //Future<Either<Failure, ResidentialComplexHousingEntity>> getResidentialComplexHousing(int id);
  //Future<Either<Failure, ResidentialComplexHousingEntity>> updateResidentialComplexHousing(ResidentialComplexHousingEntity residentialComplexHousing);
  //Future<Either<Failure, ResidentialComplexHousingEntity>> deleteResidentialComplexHousing(int id);
}