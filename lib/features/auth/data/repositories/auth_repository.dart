import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/errors/app_error.dart';
import '../../../../core/errors/repository_error_mapper.dart';
import '../../../../shared/domain/models/user.dart';
import '../datasources/auth_datasource.dart';
import '../datasources/firebase_auth_datasource.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final datasource = ref.watch(firebaseAuthDatasourceProvider);
  return AuthRepositoryImpl(datasource);
}

abstract class AuthRepository {
  Stream<AppUser?> get authStateChanges;
  Future<AppUser?> get currentUser;
  Future<Either<AppError, AppUser>> signIn({
    required String email,
    required String password,
  });
  Future<Either<AppError, AppUser>> register({
    required String email,
    required String password,
    String? name,
  });
  Future<Either<AppError, void>> signOut();
  Future<Either<AppError, void>> sendPasswordResetEmail(String email);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource _datasource;

  AuthRepositoryImpl(this._datasource);

  @override
  Stream<AppUser?> get authStateChanges => _datasource.authStateChanges;

  @override
  Future<AppUser?> get currentUser => _datasource.currentUser;

  @override
  Future<Either<AppError, AppUser>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _datasource.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(user);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }

  @override
  Future<Either<AppError, AppUser>> register({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      final user = await _datasource.registerWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      return Right(user);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }

  @override
  Future<Either<AppError, void>> signOut() async {
    try {
      await _datasource.signOut();
      return const Right(null);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }

  @override
  Future<Either<AppError, void>> sendPasswordResetEmail(String email) async {
    try {
      await _datasource.sendPasswordResetEmail(email);
      return const Right(null);
    } catch (e) {
      return Left(RepositoryErrorMapper.mapException(e));
    }
  }
}
