// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str)["content"].map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.version,
    this.createAt,
    this.updateAt,
    this.createdBy,
    this.lastModifiedBy,
    this.username,
    this.password,
    this.email,
    this.status,
  });

  int id;
  int version;
  String createAt;
  String updateAt;
  String createdBy;
  String lastModifiedBy;
  String username;
  String password;
  String email;
  String status;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        version: json["version"],
        createAt: json["createAt"],
        updateAt: json["updateAt"],
        createdBy: json["createdBy"],
        lastModifiedBy: json["lastModifiedBy"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "createAt": createAt,
        "updateAt": updateAt,
        "createdBy": createdBy,
        "lastModifiedBy": lastModifiedBy,
        "username": username,
        "password": password,
        "email": email,
        "status": status,
      };
}
