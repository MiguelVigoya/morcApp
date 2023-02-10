


import '../../data/models/residential_complex_housing_model.dart';
import '../../residential_complex_housing_entities.dart';

abstract class ResidentialComplexHousingRemoteDataSourceInterface {

  /// Calls the https://dev1.api.housing-complex.tk/residential-complex?limit=100&offset=0 endpoint.
  ///
  /// Params:
  /// limit: 100
  // offset: 0
  ///
  /// Example request: curl --location --request GET 'https://dev1.api.housing-complex.tk/residential-complex?limit=100&offset=0'
  ///
  /// Example response body:
  /// {
  ///   "data": [
  ///     {
  ///       "id": 20,
  ///       "name": "Conjunto del migue",
  ///       "address": "Las Gaviotas"
  ///     },
  ///     {
  ///       "id": 22,
  ///       "name": "Conjunto del migue",
  ///       "address": "Las Gaviotas"
  ///     },
  ///     {
  ///       "id": 24,
  ///       "name": "Conjunto del migue",
  ///       "address": "Las Gaviotas"
  ///     }
  ///   ],
  ///   "message": "Resource successfully access",
  ///   "code": 200
  /// }
  /// Trows [ServerException] for all error codes.
  Future<List<ResidentialComplexHousingModel>> getResidentialComplexHousingList({required String userToken});




  /// Calls the https://dev1.api.housing-complex.tk/residential-complex endpoint.
  ///
  /// Trows [ServerException] for all error codes.
  ///
  /// Example request:
  /// curl --location --request POST 'https://dev1.api.housing-complex.tk/residential-complex' \
  /// --data-raw '{
  ///     "name": "Conjunto del migue",
  ///     "address": "Las Gaviotas"
  /// }'
  /// Example response body:
  /// {
  ///   "data": {
  ///     "name": "Conjunto del migue",
  ///     "address": "Las Gaviotas",
  ///     "people": [],
  ///     "id": 24
  ///   },
  ///   "message": "Resource successfully created",
  ///   "code": 201
  /// }
  Future<ResidentialComplexHousingModel> createResidentialComplexHousing(
      {required ResidentialComplexHousingModel residentialComplexHousing, required String userToken});

  //Future<ResidentialComplexHousingEntity> updateResidentialComplexHousing(ResidentialComplexHousingEntity residentialComplexHousing);
  //Future<ResidentialComplexHousingEntity> getResidentialComplexHousing(int id);
  //Future<ResidentialComplexHousingEntity> deleteResidentialComplexHousing(int id);
}