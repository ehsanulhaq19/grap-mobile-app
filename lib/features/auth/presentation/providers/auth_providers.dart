import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:grap/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:grap/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:grap/features/auth/domain/entities/auth_session.dart';
import 'package:grap/features/auth/domain/repositories/auth_repository.dart';
import 'package:grap/features/auth/domain/usecases/sign_in.dart';
import 'package:grap/features/auth/domain/usecases/sign_out.dart';
import 'package:grap/features/auth/domain/usecases/sign_up.dart';
import 'package:grap/features/auth/domain/usecases/watch_auth_session.dart';

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final dataSource = AuthLocalDataSource();
  ref.onDispose(dataSource.dispose);
  return dataSource;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.watch(authLocalDataSourceProvider));
});

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  return SignInUseCase(ref.watch(authRepositoryProvider));
});

final signUpUseCaseProvider = Provider<SignUpUseCase>((ref) {
  return SignUpUseCase(ref.watch(authRepositoryProvider));
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  return SignOutUseCase(ref.watch(authRepositoryProvider));
});

final watchAuthSessionUseCaseProvider = Provider<WatchAuthSessionUseCase>((ref) {
  return WatchAuthSessionUseCase(ref.watch(authRepositoryProvider));
});

final authSessionProvider = StreamProvider<AuthSession?>((ref) {
  return ref.watch(watchAuthSessionUseCaseProvider)();
});
