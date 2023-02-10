import 'package:equatable/equatable.dart';

import '../../../residential_complex_housing/residential_complex_housing_models.dart';

class DataResponseAuth extends Equatable {
  final String accessToken;
  final int personId;
  final int userId;
  final String username;
  final String personEmail;
  final String name;
  final String? lastName;
  final String? birth;
  final int? numberId;
  final List<String> roles;
  final ResidentialComplexHousingModel? complexHousing;

  const DataResponseAuth({
    required this.accessToken,
    required this.personId,
    required this.userId,
    required this.username,
    required this.personEmail,
    required this.name,
    this.lastName,
    this.birth,
    this.numberId,
    required this.roles,
    this.complexHousing,
  });

  @override
  List<Object?> get props => [
    accessToken,
    personId,
    userId,
    username,
    personEmail,
    name,
    lastName,
    birth,
    numberId,
    roles,
    complexHousing,
  ];


}