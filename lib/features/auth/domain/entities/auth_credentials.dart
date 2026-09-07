class AuthCredentials {
  const AuthCredentials({
    required this.email,
    required this.password,
    this.fullName,
  });

  final String email;
  final String password;
  final String? fullName;
}
