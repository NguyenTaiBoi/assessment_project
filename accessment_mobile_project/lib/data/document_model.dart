// To parse this JSON data, do
//
//     final document = documentFromJson(jsonString);

import 'dart:convert';

List<Document> documentFromJson(String str) => List<Document>.from(
    json.decode(str)["content"].map((x) => Document.fromJson(x)));

String documentToJson(List<Document> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Document {
  Document({
    this.id,
    this.version,
    this.createAt,
    this.updateAt,
    this.createdBy,
    this.lastModifiedBy,
    this.name,
    this.description,
  });

  int id;
  int version;
  String createAt;
  String updateAt;
  String createdBy;
  String lastModifiedBy;
  String name;
  String description;

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        id: json["id"],
        version: json["version"],
        createAt: json["createAt"],
        updateAt: json["updateAt"],
        createdBy: json["createdBy"],
        lastModifiedBy: json["lastModifiedBy"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "createAt": createAt,
        "updateAt": updateAt,
        "createdBy": createdBy,
        "lastModifiedBy": lastModifiedBy,
        "name": name,
        "description": description,
      };
}
