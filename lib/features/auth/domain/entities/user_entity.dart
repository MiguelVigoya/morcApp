import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String name;
  final String? loginAt;
  final String? createAt;
  final List<String> roles;

  const UserEntity({
    this.id,
    required this.name,
    this.loginAt,
    this.createAt,
    required this.roles,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        loginAt,
        createAt,
        roles,
      ];
}