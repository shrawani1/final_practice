import 'package:dartz/dartz.dart';
import 'package:final_practice/core/failure/failure.dart';
import 'package:final_practice/core/networking/local/hive_service.dart';
import 'package:final_practice/features/auth/data/model/auth_hive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authLocalDataSourceProvider = Provider((ref) => AuthLocalDataSource(
    hiveService: ref.read(hiveServiceProvider),
    authHiveModel: ref.read(authHiveModelProvider)));

class AuthLocalDataSource {
  final HiveService hiveService;
  final AuthHiveModel authHiveModel;

  AuthLocalDataSource({required this.hiveService, required this.authHiveModel});

  


  // Login
  Future<Either<Failure, bool>> login(String username, String password) async {
    try {
      final student = await hiveService.login(username, password);

      if (student == null) {
        return const Right(false);
      }

      return const Right(true);
    } catch (e) {
      return Left(Failure(error: e.toString()));
    }
  }
}
