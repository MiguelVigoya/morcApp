import 'package:equatable/equatable.dart';

class ResidentialComplexHousingEntity extends Equatable {
  ResidentialComplexHousingEntity({
    required this.name,
    required this.address,
    required this.personIds,
    this.subscription,
    this.id,
  });

  String name;
  String address;
  List<int> personIds;
  int? id;
  bool? subscription;

  @override
  List<Object?> get props => [id, name, address, personIds, subscription];
}
