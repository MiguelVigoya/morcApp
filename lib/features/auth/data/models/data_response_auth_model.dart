import 'dart:convert';
import '../../auth_entities.dart';
import '../../auth_models.dart';

class DataResponseAuthModel extends DataResponseAuth {
  @override
  final String accessToken;
  @override
  final int personId;
  @override
  final int userId;
  @override
  final String username;
  @override
  final String personEmail;
  @override
  final String name;
  @override
  final String? lastName;
  @override
  final String? birth;
  @override
  final int? numberId;
  @override
  final List<String> roles;
  @override
  final ComplexHousingModel? complexHousing;

  const DataResponseAuthModel(
    this.accessToken,
    this.personId,
    this.userId,
    this.username,
    this.personEmail,
    this.name,
    this.lastName,
    this.birth,
    this.numberId,
    this.roles,
    this.complexHousing,
  ) : super(
          accessToken: accessToken,
          personId: personId,
          userId: userId,
          username: username,
          personEmail: personEmail,
          name: name,
          lastName: lastName,
          birth: birth,
          numberId: numberId,
          roles: roles,
          complexHousing: complexHousing,
        );

  factory DataResponseAuthModel.fromMap(Map<String, dynamic> json) => DataResponseAuthModel(
    json["accessToken"] ?? '',
    json["personId"],
    json["userId"],
    json["username"],
    json["personEmail"],
    json["name"] ?? '',
    json["lastName"],
    json["birth"],
    json["numberId"],
    json["roles"] = List<String>.from(json["roles"].map((x) => x)),
    json["complexHousing"] == null ? null : ComplexHousingModel.fromMap(json["complexHousing"]),
  );

  factory DataResponseAuthModel.fromJson(String str) => DataResponseAuthModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "accessToken": accessToken,
    "personId": personId,
    "userId": userId,
    "username": username,
    "personEmail": personEmail,
    "name": name,
    "lastName": lastName,
    "birth": birth,
    "numberId": numberId,
    "roles": List<dynamic>.from(roles.map((x) => x)),
    "complexHousing": complexHousing == null ? null : complexHousing!.toMap(),
  };

  copy() => DataResponseAuthModel(
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
  );
}
