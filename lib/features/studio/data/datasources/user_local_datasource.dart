import 'dart:async';

import 'package:grap/features/studio/domain/entities/user_profile.dart';

class UserLocalDataSource {
  UserLocalDataSource() {
    _profile = const UserProfile(
      id: 'user-1',
      fullName: 'Alex',
      email: 'alex@company.com',
      avatarUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAzXYjlsaRm41w3YPDAW_Nif6sw0_IrqpEjTnyJNpBMJ2F87kgN_F7NAqx0OtWJX0ObD0aoIQ9uGt3M9nfPhF8eCyLp9JgT1vedP5mEIssb-tE1P4q5U97xmSjAoeuPxgXbaG8t1Gs6bj4AWoNyTi8VnedXA8siPQYP-4LIraEjtOjaSqlF5GR24WwdnjZD3FmojGRZfWoHYLU3k5sDnUWwquRm3xCiM-ij1BqxbqYzWN1wQEwxtVW9zQ',
    );
    _controller = StreamController<UserProfile>.broadcast(
      onListen: () => _controller.add(_profile),
    );
  }

  late final UserProfile _profile;
  late final StreamController<UserProfile> _controller;

  Future<UserProfile> getProfile() async => _profile;

  Stream<UserProfile> watchProfile() => _controller.stream;

  void dispose() {
    _controller.close();
  }
}
