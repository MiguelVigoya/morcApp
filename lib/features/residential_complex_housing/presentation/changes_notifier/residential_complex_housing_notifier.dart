import 'package:flutter/material.dart';

import '../../../../core/error/exceptions.dart';
import '../../data/repositories/residential_complex_housing_implementation_data.dart';
import '../../domain/entities/residential_complex_housing_entity.dart';
import '../../residential_complex_housing_models.dart';

class ResidentialComplexHousingNotifier extends ChangeNotifier {
  List<ResidentialComplexHousingModel> residentialComplexHousingList = [];
  bool isLoadingResidentialComplexes = true;
  bool isSavingResidentialComplex = false;
  late ResidentialComplexHousingModel selectedResidentialComplex;

  final ResidentialComplexHousingImplementationData
      residentialComplexHousingImplementationData;

  ResidentialComplexHousingNotifier(
      {required this.residentialComplexHousingImplementationData});

  Future<List<ResidentialComplexHousingModel>>
      getResidentialComplexHousingList() async {

    final result = await residentialComplexHousingImplementationData
        .getResidentialComplexHousingList();

    result.fold((l) =>
        ServerException(message: 'Error: $l'),
        (r) => residentialComplexHousingList = r);

    notifyListeners();
    return residentialComplexHousingList;
  }
}
