import 'package:flutter/material.dart';

import '../../../../core/error/exceptions.dart';
import '../../data/repositories/residential_complex_housing_implementation_data.dart';
import '../../residential_complex_housing_models.dart';

class ResidentialComplexHousingNotifier extends ChangeNotifier {
  GlobalKey<FormState> formRegisterResidentialComplexHousingKey = GlobalKey<FormState>(); // conecta el key del widget a una variable especifica


  List<ResidentialComplexHousingModel> residentialComplexHousingList = [];

  bool isLoadingResidentialComplexes = true;
  bool isSavingResidentialComplex = false;

  late ResidentialComplexHousingModel selectedResidentialComplex;

   ResidentialComplexHousingModel residentialComplexHousing;


  final ResidentialComplexHousingImplementationData
      residentialComplexHousingImplementationData;

  ResidentialComplexHousingNotifier(
      {required this.residentialComplexHousingImplementationData,
      required this.residentialComplexHousing
      });



  Future<List<ResidentialComplexHousingModel>> getResidentialComplexHousingList() async {

    isLoadingResidentialComplexes = true;
    final result = await residentialComplexHousingImplementationData
        .getResidentialComplexHousingList();

    result.fold((l) =>
        ServerException(message: 'Error: $l'),
        (r) => residentialComplexHousingList = r);

    isLoadingResidentialComplexes = false;
    notifyListeners();
    return residentialComplexHousingList;
  }


  Future<bool> createResidentialComplexHousing() async {
    isSavingResidentialComplex = true;
    notifyListeners();


    final result = await residentialComplexHousingImplementationData
        .createResidentialComplexHousing(residentialComplexHousing: residentialComplexHousing);

    result.fold((error) =>
        ServerException(message: 'Error: $error'),
        (residentialComplexSaved) {
          residentialComplexHousing = residentialComplexSaved;
        });

    residentialComplexHousingList.insert(0, residentialComplexHousing);
    isSavingResidentialComplex = false;
    notifyListeners();
    return true;
  }


  bool isValidForm() {
    return formRegisterResidentialComplexHousingKey.currentState?.validate() ?? false;
  }


  @override
  toString() {
    return 'selectedResidentialComplex.name: ${selectedResidentialComplex.name}, '
        ' selectedResidentialComplex.id: ${selectedResidentialComplex.id} '
        'selectedResidentialComplex.address: ${selectedResidentialComplex.address} '
        'selectedResidentialComplex.phone: ${selectedResidentialComplex.personIds.toString()}'
        'selectedResidentialComplex.personIds: ${selectedResidentialComplex.subscription}';
  }
}
