// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

import 'dart:typed_data';

List<CategoryModel> categoryModelFromJson(Uint8List str) =>
    List<CategoryModel>.from(json
        .decode(utf8.decode(str))['content']
        .map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    this.id,
    this.version,
    this.createAt,
    this.updateAt,
    this.createdBy,
    this.lastModifiedBy,
    this.code,
    this.name,
    this.description,
  });

  int id;
  int version;
  String createAt;
  String updateAt;
  String createdBy;
  String lastModifiedBy;
  String code;
  String name;
  String description;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        version: json["version"],
        createAt: json["createAt"],
        updateAt: json["updateAt"],
        createdBy: json["createdBy"],
        lastModifiedBy: json["lastModifiedBy"],
        code: json["code"],
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
        "code": code,
        "name": name,
        "description": description,
      };
}
