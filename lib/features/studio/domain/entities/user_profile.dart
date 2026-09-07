class UserProfile {
  const UserProfile({
    required this.id,
    required this.fullName,
    required this.email,
    required this.avatarUrl,
  });

  final String id;
  final String fullName;
  final String email;
  final String avatarUrl;
}
