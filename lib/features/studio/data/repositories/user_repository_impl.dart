import 'package:grap/features/studio/data/datasources/user_local_datasource.dart';
import 'package:grap/features/studio/domain/entities/user_profile.dart';
import 'package:grap/features/studio/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._localDataSource);

  final UserLocalDataSource _localDataSource;

  @override
  Future<UserProfile> getProfile() => _localDataSource.getProfile();

  @override
  Stream<UserProfile> watchProfile() => _localDataSource.watchProfile();
}
