import 'package:equatable/equatable.dart';

class ResidentialComplexHousingEntity extends Equatable{

     ResidentialComplexHousingEntity({
    required this.name,
    required this.address,
    this.id,
    this.personIds,
    this.subscription,

   });

   final String name;
   final String address;
     late final int? id;
    late final List<int>? personIds;
    late final bool? subscription;

   @override
  List<Object?> get props => [id, name, address, personIds, subscription];
}