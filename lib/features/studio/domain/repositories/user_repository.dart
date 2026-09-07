import 'package:grap/features/studio/domain/entities/user_profile.dart';

abstract class UserRepository {
  Future<UserProfile> getProfile();

  Stream<UserProfile> watchProfile();
}
