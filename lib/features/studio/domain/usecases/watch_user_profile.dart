import 'package:grap/features/studio/domain/entities/user_profile.dart';
import 'package:grap/features/studio/domain/repositories/user_repository.dart';

class WatchUserProfileUseCase {
  const WatchUserProfileUseCase(this._repository);

  final UserRepository _repository;

  Stream<UserProfile> call() => _repository.watchProfile();
}
