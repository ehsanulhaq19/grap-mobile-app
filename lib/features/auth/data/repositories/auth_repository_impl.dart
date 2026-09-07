import 'package:grap/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:grap/features/auth/domain/entities/auth_credentials.dart';
import 'package:grap/features/auth/domain/entities/auth_session.dart';
import 'package:grap/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._localDataSource);

  final AuthLocalDataSource _localDataSource;

  @override
  Stream<AuthSession?> watchSession() => _localDataSource.watchSession();

  @override
  Future<AuthSession> signIn(AuthCredentials credentials) {
    return _localDataSource.signIn(credentials);
  }

  @override
  Future<AuthSession> signUp(AuthCredentials credentials) {
    return _localDataSource.signUp(credentials);
  }

  @override
  Future<void> signOut() => _localDataSource.signOut();
}
