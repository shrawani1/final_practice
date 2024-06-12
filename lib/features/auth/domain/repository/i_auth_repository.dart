import 'package:dartz/dartz.dart';
import 'package:final_practice/core/failure/failure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repository/auth_local_repository.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.watch(authLocalRepository);
});

abstract class IAuthRepository {

  Future<Either<Failure, bool>> login(String username, String password);
}
