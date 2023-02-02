import 'package:equatable/equatable.dart';

class ComplexHousing extends Equatable{
  final int id;
  final String name;
  final String address;

  const ComplexHousing({
    required this.id,
    required this.name,
    required this.address,
  });

  @override
  List<Object?> get props => [id, name, address];
}