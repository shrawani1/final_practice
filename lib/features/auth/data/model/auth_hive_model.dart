import 'package:final_practice/app/constants/hive_table_constant.dart';
import 'package:final_practice/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'auth_hive_model.g.dart';

final authHiveModelProvider = Provider(
  (ref) => AuthHiveModel.empty(),
);

@HiveType(typeId: 0)
class AuthHiveModel extends HiveObject {

  @HiveField(1)
  final String fullname;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String username;

  @HiveField(4)
  final String password;

  // Constructor
  AuthHiveModel({
    required this.fullname,
    required this.phone,
    required this.username,
    required this.password,
  });

  // Empty constructor
  AuthHiveModel.empty()
      : this(
          fullname: '',
          phone: '',
          username: '',
          password: '',
        );

  // Convert Hive Object to Entity
  AuthEntity toEntity() => AuthEntity(
        fullname: fullname,
        phone: phone,
        username: username,
        password: password,
      );

  // Convert Entity to Hive Object
  static AuthHiveModel fromEntity(AuthEntity entity) => AuthHiveModel(
        fullname: entity.fullname,
        phone: entity.phone,
        username: entity.username,
        password: entity.password,
      );

  // Convert Entity List to Hive List
  static List<AuthHiveModel> fromEntityList(List<AuthEntity> entities) =>
      entities.map((entity) => fromEntity(entity)).toList();

  @override
  String toString() {
    return 'fullname: $fullname, phone: $phone, username: $username, password: $password';
  }
}
