class AuthSession {
  const AuthSession({
    required this.userId,
    required this.email,
  });

  final String userId;
  final String email;

  bool get isAuthenticated => userId.isNotEmpty;
}
