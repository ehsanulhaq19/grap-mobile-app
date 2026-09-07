import 'package:grap/features/auth/domain/entities/auth_session.dart';
import 'package:grap/features/auth/domain/repositories/auth_repository.dart';

class WatchAuthSessionUseCase {
  const WatchAuthSessionUseCase(this._repository);

  final AuthRepository _repository;

  Stream<AuthSession?> call() => _repository.watchSession();
}
