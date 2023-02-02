import 'package:equatable/equatable.dart';

class AuthRequest extends Equatable {
     String email;
     String password;
    AuthRequest({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];

}