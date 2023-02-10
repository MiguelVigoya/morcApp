import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:io';

import '../../domain/repositories/residential_complex_housing_romote_data_source_interface.dart';
import '../../common/constant_values_api_residential_complex_housing.dart';
import '../../residential_complex_housing_models.dart';

class ResidentialComplexHousingRemoteDataSourceFromApi
    implements ResidentialComplexHousingRemoteDataSourceInterface {
  @override
  Future<ResidentialComplexHousingModel> createResidentialComplexHousing(
      {required ResidentialComplexHousingModel residentialComplexHousing,
      required String userToken}) async {
    // TODO: implement createResidentialComplexHousing

    final uri = Uri.parse('$getBaseUrl$createResidentialComplexHousingPath');
    final responseCreateBackend = await http
        .post(uri, body: residentialComplexHousing.toJson(), headers: {
      HttpHeaders.authorizationHeader: 'Bearer $userToken',
      HttpHeaders.contentTypeHeader: 'application/json'
    });

    final Map<String, dynamic>? jsonResponse =
        convert.jsonDecode(responseCreateBackend.body);

    if (responseCreateBackend.statusCode == 200 &&
        jsonResponse!['data'] != null) {
      return ResidentialComplexHousingModel.fromJson(jsonResponse['data']);
    } else {
      throw Exception(jsonResponse!['message']);
    }
  }

  @override
  Future<List<ResidentialComplexHousingModel>> getResidentialComplexHousingList(
      {required String userToken}) async {

    final List<ResidentialComplexHousingModel> residentialComplexes = [];

    final uri = Uri.parse('$getBaseUrl$getResidentialComplexHousingListPath');

    final responseGetBackend = await http.get(
        uri,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $userToken'}
    );


    final Map<String, dynamic>? jsonResponse = convert.jsonDecode(responseGetBackend.body);
    if (responseGetBackend.statusCode == 200 && jsonResponse!['data'] != null) {
      for (Map<String, dynamic> residentialComplex in jsonResponse['data']) {
        final tempResidential = ResidentialComplexHousingModel.fromMap(residentialComplex);
        //TODO: IMPLEMENTAR EN BACKEND EL CAMPO SUBSCRIPTION...
        tempResidential.subscription = true;
        residentialComplexes.add(tempResidential);
      }
    }
    return residentialComplexes;
  }
}
