


import 'dart:convert';

import 'package:clean_morc/features/persons/person_entities.dart';

class UserModel extends UserEntity {

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String telephone;
  @override
  final String role;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.telephone,
    required this.role,
  }): super(
    id: id,
    name: name,
    email: email,
    telephone: telephone,
    role: role,
  );

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    telephone: json["telephone"] ?? '123',
    role: json["role"] ?? 'HANDLER_PERSON'
  );

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "telephone": telephone,
    "role": role,
  };

  copy() => UserModel(
    id: id,
    name: name,
    email: email,
    telephone: telephone,
    role: role,
  );

  @override
  toString() => 'UserModel(id: $id, name: $name, email: $email, telephone: $telephone, role: $role)';
}