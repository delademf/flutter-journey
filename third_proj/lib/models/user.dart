class User {
  final int id;
  final String firstName;
  final String email;
  final String image; // Base64 encoded image

  User(
      {required this.firstName,
      required this.image,
      required this.email,
      required this.id,});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'] ?? 'Unknown', // Default value if null
      image: json['image'] ?? '', // Default to an empty string if null
      email: json['email'] ?? '', // Default to an empty string if null
      id: json['id'] ?? '', // Default value if null
    );
  }
}