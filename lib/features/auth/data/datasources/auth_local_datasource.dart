import 'dart:async';

import 'package:grap/features/auth/domain/entities/auth_credentials.dart';
import 'package:grap/features/auth/domain/entities/auth_session.dart';

class AuthLocalDataSource {
  AuthLocalDataSource() {
    _controller = StreamController<AuthSession?>.broadcast(
      onListen: () => _controller.add(_session),
    );
  }

  late final StreamController<AuthSession?> _controller;
  AuthSession? _session;

  Stream<AuthSession?> watchSession() => _controller.stream;

  Future<AuthSession> signIn(AuthCredentials credentials) async {
    _session = AuthSession(
      userId: 'user-1',
      email: credentials.email,
    );
    _controller.add(_session);
    return _session!;
  }

  Future<AuthSession> signUp(AuthCredentials credentials) async {
    return signIn(credentials);
  }

  Future<void> signOut() async {
    _session = null;
    _controller.add(null);
  }

  void dispose() {
    _controller.close();
  }
}
