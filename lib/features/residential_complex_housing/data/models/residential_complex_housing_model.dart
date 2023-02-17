import 'dart:convert';

import '../../residential_complex_housing_entities.dart';


class ResidentialComplexHousingModel extends ResidentialComplexHousingEntity {
  @override
  String name;

  @override
  String address;

  @override
  List<int> personIds;


  @override
  int? id;

  @override
  bool? subscription;


   ResidentialComplexHousingModel({
     this.id,
    required this.name,
    required this.address,
     required this.personIds,
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
        subscription: json["subscription"],
        personIds: json["personIds"] == null ? [] : List<int>.from(json["personIds"].map((x) => x))
      );

  factory ResidentialComplexHousingModel.fromJson(String str) => ResidentialComplexHousingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "subscription": subscription,
        "personIds": List<int>.from(personIds.map((x) => x)),
      };

    ResidentialComplexHousingModel copy() => ResidentialComplexHousingModel(
      id: id,
      name: name,
      address: address,
      personIds: personIds,
      subscription: subscription,
    );
}