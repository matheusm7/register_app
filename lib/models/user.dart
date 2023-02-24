class User {
  final String id;
  final String name;
  final String email;
  final String AvatarUrl;

  const User({
    required this.id,
    required this.name,
    required this.email,
    this.AvatarUrl = '',
  });
}
