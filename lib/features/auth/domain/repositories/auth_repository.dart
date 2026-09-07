import 'package:grap/features/auth/domain/entities/auth_credentials.dart';
import 'package:grap/features/auth/domain/entities/auth_session.dart';

abstract class AuthRepository {
  Stream<AuthSession?> watchSession();

  Future<AuthSession> signIn(AuthCredentials credentials);

  Future<AuthSession> signUp(AuthCredentials credentials);

  Future<void> signOut();
}
