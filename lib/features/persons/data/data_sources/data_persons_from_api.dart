

import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;



import 'package:clean_morc/features/persons/domain/entities/person_remote_data_source_interface.dart';

import '../../common/constant_values_api_person.dart';
import '../../person_models.dart';

class DataPersonsFromApi implements PersonRemoteDataSourceInterface{

  @override
  Future<List<UserModel>> getAllHandleComplexHousing({required String userToken}) async{
    final List<UserModel> handlersPersons = [];
    final uri = Uri.parse('$baseUrl$personsPath$getAllHandlersPath');

    final responsePostGetAllHandlerPerson = await http.get(
      uri,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $userToken'}
    );
    final Map<String, dynamic>? jsonResponse = convert.jsonDecode(responsePostGetAllHandlerPerson.body);

    if (responsePostGetAllHandlerPerson.statusCode == 200 && jsonResponse!['data'] != null) {
      for (Map<String, dynamic> handlerPerson in jsonResponse['data']) {
        final tempHandlerPerson = UserModel.fromMap(handlerPerson);
        handlersPersons.add(tempHandlerPerson);
      }
    }

    return handlersPersons;
  }

    //return ServerException( message: 'Error al autenticar');
}