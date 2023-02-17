import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String telephone;
  final String role;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.telephone,
    required this.role,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    telephone,
    role,];
}