import 'package:clean_morc/features/persons/person_models.dart';
import 'package:flutter/material.dart';

import 'package:clean_morc/features/persons/data/repositories/person_repository_implementation_data.dart';

class PersonNotifier extends ChangeNotifier {


  final List<String> _handlersPersonsName = [];
  List<String> get handlersPersonsName => _handlersPersonsName;



  List<UserModel> _handlersPersons = [];
  List<UserModel> get handlersPersons => _handlersPersons;
  set handlersPersons(List<UserModel> value) {
    _handlersPersons = value;
    notifyListeners();
  }

  final PersonRepositoryImplementationData personRepositoryImplementationData;


  PersonNotifier({required this.personRepositoryImplementationData});


  Future<List<String>> getHandlersPersonsName() async {
    final result = await personRepositoryImplementationData.getAllHandleComplexHousing();
    result.fold(
      (failure) => print(failure),
      (persons) => _handlersPersons = persons,
    );
    _handlersPersonsName.clear();
    for (UserModel person in _handlersPersons) {
      _handlersPersonsName.add(person.name);
    }
    return _handlersPersonsName;
  }
}