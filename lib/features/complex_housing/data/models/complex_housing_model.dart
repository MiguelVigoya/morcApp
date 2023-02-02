import 'dart:convert';
import '../../../auth/auth_entities.dart';


class ComplexHousingModel extends ComplexHousing {
  @override
  final int id;
  @override
  final String name;
  @override
  final String address;

  const ComplexHousingModel({
    required this.id,
    required this.name,
    required this.address,
  }) : super(
          id: id,
          name: name,
          address: address,
        );

  factory ComplexHousingModel.fromMap(Map<String, dynamic> json) => ComplexHousingModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
      );

  factory ComplexHousingModel.fromJson(String str) => ComplexHousingModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
      };

  copy() => ComplexHousingModel(
        id: id,
        name: name,
        address: address,
      );
}