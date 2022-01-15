class UserModel {
  final String username;

  const UserModel({
    this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] as String,
    );
  }
}
