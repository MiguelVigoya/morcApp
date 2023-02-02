import 'dart:convert';
import '../../auth_entities.dart';
import '../../auth_models.dart';


class AuthResponseModel extends AuthResponse{

  @override
  final DataResponseAuthModel? data;
  @override
  final String? message;
  @override
  final int? code;

  const AuthResponseModel({
    this.data,
    this.message,
    this.code,
  }): super(
    data: data,
    message: message,
    code: code,
  );

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
    data: DataResponseAuthModel.fromMap(json["data"]),
    message: json["message"],
    code: json["code"],
  );

  factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
    "data": data?.toMap(),
    "message": message,
    "code": code,
  };

  copy() => AuthResponseModel(
    data: data?.copy(),
    message: message,
    code: code,
  );

}