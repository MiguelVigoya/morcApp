import 'package:flutter/material.dart';

import '../../data/data_sources/data_login_from_api.dart';
import '../../data/repositories/auth_repository_implementation_data.dart';
import '../../domain/entities/auth_request.dart';
import '../../domain/repositories/auth_repository_interface.dart';

class DataFormLoginProvider extends ChangeNotifier {
  DataLoginFromApi dataLoginFromApi = DataLoginFromApi();

  final TextEditingController emailController = TextEditingController(text: 'super-admin@housing-complex.tk');
  final TextEditingController passwordController = TextEditingController(text: 'super_admin');
  final AuthRequest authRequest;

  DataFormLoginProvider({required this.authRequest});

  Future<bool> login() async {
    authRequest.email = emailController.text;
    authRequest.password = passwordController.text;
    final AuthRepositoryInterface loginRepositoryImplementationData =
        AuthRepositoryImplementationData(dataLoginFromApi: dataLoginFromApi);
    try {
      final response = await loginRepositoryImplementationData.login(authRequest);
      print('response: $response');
      return true;
    } catch (e) {
      return false;
    }
  }
}
//TODO: abstrac factory o abstract methode. averiguar la inyeccion de dependencia en dart. averiguar si es mejor uso de clases esttaticas en vez de inyeccion de dependencia.???
