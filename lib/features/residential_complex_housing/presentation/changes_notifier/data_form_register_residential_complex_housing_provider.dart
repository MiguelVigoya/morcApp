import 'package:flutter/material.dart';

import '../../data/models/residential_complex_housing_model.dart';


class DataFormRegisterResidentialComplexHousingProvider extends ChangeNotifier{

  GlobalKey<FormState> formRegisterResidentialComplexHousingKey = GlobalKey<FormState>(); // conecta el key del widget a una variable especifica

  final ResidentialComplexHousingModel residentialComplexHousing;

  DataFormRegisterResidentialComplexHousingProvider(this.residentialComplexHousing);

  setResidentialComplexHousingName(String value) => residentialComplexHousing.name = value;
  setResidentialComplexHousingAddress(String value) => residentialComplexHousing.address = value;
  setResidentialComplexHousingPhone(int value) => residentialComplexHousing.personIds?.add(value);
  setResidentialComplexHousingSubscription(bool value) => residentialComplexHousing.subscription = value;



  bool isValidForm() {
    return formRegisterResidentialComplexHousingKey.currentState?.validate() ?? false;
  }


}