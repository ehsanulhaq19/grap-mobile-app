import 'package:flutter_test/flutter_test.dart';

import 'package:grap/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:grap/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:grap/features/auth/domain/entities/auth_credentials.dart';
import 'package:grap/features/auth/domain/usecases/sign_in.dart';
import 'package:grap/features/auth/domain/usecases/sign_out.dart';

void main() {
  late AuthLocalDataSource dataSource;
  late SignInUseCase signIn;
  late SignOutUseCase signOut;

  setUp(() {
    dataSource = AuthLocalDataSource();
    final repository = AuthRepositoryImpl(dataSource);
    signIn = SignInUseCase(repository);
    signOut = SignOutUseCase(repository);
  });

  tearDown(() {
    dataSource.dispose();
  });

  test('SignInUseCase creates an authenticated session', () async {
    final session = await signIn(
      const AuthCredentials(email: 'test@grap.app', password: 'secret'),
    );

    expect(session.isAuthenticated, isTrue);
    expect(session.email, 'test@grap.app');
  });

  test('SignOutUseCase clears the active session', () async {
    await signIn(
      const AuthCredentials(email: 'test@grap.app', password: 'secret'),
    );

    await signOut();

    final events = <bool>[];
    final subscription = dataSource.watchSession().listen((session) {
      events.add(session?.isAuthenticated ?? false);
    });

    await Future<void>.delayed(Duration.zero);
    await subscription.cancel();

    expect(events, contains(false));
  });
}
