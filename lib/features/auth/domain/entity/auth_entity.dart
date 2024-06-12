import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  
  final String fullname;
  final String? image;
  final String phone;
  final String username;
  final String password;

  const AuthEntity({
    
    required this.fullname,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props =>
      [fullname, image, phone, username, password];
}
