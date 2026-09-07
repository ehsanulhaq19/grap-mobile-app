import 'package:grap/features/auth/domain/entities/auth_credentials.dart';
import 'package:grap/features/auth/domain/entities/auth_session.dart';
import 'package:grap/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  const SignUpUseCase(this._repository);

  final AuthRepository _repository;

  Future<AuthSession> call(AuthCredentials credentials) {
    return _repository.signUp(credentials);
  }
}
