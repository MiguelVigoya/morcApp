import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../core/error/exceptions.dart';
import '../../auth_entities.dart';
import '../../common/constant_values_api_auth.dart';
import '../../domain/repositories/login_remote_data_source_interface.dart';
import '../models/auth_response_model.dart';
import 'data_login_from_local_storage.dart';

class DataLoginFromApi implements LoginRemoteDataSourceInterface {

  @override
  Future<AuthResponseModel> login(AuthRequest loginRequest) async {

    // TODO: change to use the local storage for the [AppPreferences] class static into Core module directory.
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final DataLoginFromLocalStorage localStorage = DataLoginFromLocalStorage(sharedPreferences: sharedPreferences);

    final Map<String, dynamic> authData = {
      'email': loginRequest.email,
      'password': loginRequest.password
    };

    final url = Uri.https(baseUrl, loginPath);

    final String authDataString =
        "${loginRequest.email}:${loginRequest.password}";

    final authDataBase64 = base64.encode(authDataString.codeUnits);

    final response = await http.post(
        url,
        body: jsonEncode(authData),
        headers: {HttpHeaders.authorizationHeader: 'Basic $authDataBase64'});

    final Map<String, dynamic> decodeResponse = jsonDecode(response.body);
    if(response.statusCode == 200 || response.statusCode == 201) {
      //TODO: create a model for user to save in local storage - change the save to datastore
      localStorage.setToken(decodeResponse['data']['access_token']);
      localStorage.setRole(decodeResponse['data']['roles'][0]);
      localStorage.setUserName(decodeResponse['data']['username']);
      localStorage.setUserEmail(decodeResponse['data']['personEmail']);
      return AuthResponseModel.fromJson(response.body);
    } else {
      throw ServerException( message: 'Error al autenticar');
    }
  }

  @override
  Future<AuthResponseModel> register(AuthRequest loginRequest) {
    // TODO: implement register
    throw UnimplementedError();
  }
}

