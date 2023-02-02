import 'package:flutter/material.dart';

import '../../data/data_sources/data_login_from_api.dart';
import '../../data/repositories/auth_repository_implementation_data.dart';
import '../../domain/entities/auth_request.dart';

class DataFormLoginProvider extends ChangeNotifier {
  DataLoginFromApi dataLoginFromApi = DataLoginFromApi();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthRequest authRequest;

  DataFormLoginProvider({required this.authRequest});

  Future<bool> login() async {
    authRequest.email = emailController.text;
    authRequest.password = passwordController.text;
    final AuthRepositoryImplementationData loginRepositoryImplementationData =
        AuthRepositoryImplementationData(dataLoginFromApi: dataLoginFromApi);
    try {
      final response = await loginRepositoryImplementationData.dataLoginFromApi.login(authRequest);
      print('response: $response');
      return true;
    } catch (e) {
      return false;
    }
  }
}
