class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String photoUrl;
  final String role;
  final String description;
  //final List<Video> favoritesVideos;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.photoUrl,
      this.role,
      this.description});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson['_id'] as String,
      firstName: parsedJson['firstName'] as String,
      lastName: parsedJson['lastName'] as String,
      description: parsedJson['description'] as String,
      email: parsedJson['email'] as String,
      photoUrl: parsedJson['photoUrl'] as String,
      role: parsedJson['role'] as String
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['role'] = role;
    data['description'] = description;
    data['photoUrl'] = photoUrl;

    return data;
  }
}
