import 'package:equatable/equatable.dart';
import 'data_response_auth.dart';

class AuthResponse extends Equatable {
  final DataResponseAuth? data;
  final String? message;
  final int? code;
  const AuthResponse({
      this.data,
     this.message,
     this.code,
  });

  @override
  List<Object?> get props => [
        data,
        message,
        code,
      ];
}
