


import '../../person_models.dart';

abstract class PersonRemoteDataSourceInterface {
  /// Calls the https://dev1.api.housing-complex.tk/person?rolName=HANDLE_COMPLEX_HOUSING endpoint.
  ///
  /// Trows [ServerException] for all error codes.
  Future<List<UserModel>> getAllHandleComplexHousing({required String userToken});
}