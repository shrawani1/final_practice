import 'package:dartz/dartz.dart';
import 'package:final_practice/core/failure/failure.dart';
import 'package:final_practice/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/repository/i_auth_repository.dart';

final authLocalRepository = Provider<IAuthRepository>((ref) {
  return AuthLocalRepository(
      authLocalDataSource: ref.read(authLocalDataSourceProvider));
});

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource authLocalDataSource;

  AuthLocalRepository({required this.authLocalDataSource});


  @override
  Future<Either<Failure, bool>> login(String username, String password) {
    return authLocalDataSource.login(username, password);
  }
  
  
}
