import 'package:grap/features/studio/domain/entities/user_profile.dart';
import 'package:grap/features/studio/domain/repositories/user_repository.dart';

class GetUserProfileUseCase {
  const GetUserProfileUseCase(this._repository);

  final UserRepository _repository;

  Future<UserProfile> call() => _repository.getProfile();
}
