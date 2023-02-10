import 'dart:convert';

import '../../residential_complex_housing_entities.dart';


class ResidentialComplexHousingModel extends ResidentialComplexHousingEntity {
  @override
  final String name;

  @override
  final String address;

  @override
  int? id;

  @override
  List<int>? personIds;

  @override
  bool? subscription;


   ResidentialComplexHousingModel({
    required this.id,
    required this.name,
    required this.address,
    this.personIds,
    this.subscription,

  }) : super(
          id: id,
          name: name,
          address: address,
          personIds: personIds,
          subscription: subscription,
        );

  factory ResidentialComplexHousingModel.fromMap(Map<String, dynamic> json) => ResidentialComplexHousingModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        personIds: json["personIds"],
        subscription: json["subscription"],
      );

  factory ResidentialComplexHousingModel.fromJson(String str) => ResidentialComplexHousingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "subscription": subscription,
        "personIds": List<int>.from(personIds!.map((x) => x)),
      };

    ResidentialComplexHousingModel copy() => ResidentialComplexHousingModel(
      id: id,
      name: name,
      address: address,
      personIds: personIds,
      subscription: subscription,
    );
}