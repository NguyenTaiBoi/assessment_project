// To parse this JSON data, do
//
//     final fileModel = fileModelFromJson(jsonString);

import 'dart:convert';

List<FileModel> fileModelFromJson(String str) => List<FileModel>.from(
    json.decode(str)["content"].map((x) => FileModel.fromJson(x)));

String fileModelToJson(List<FileModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FileModel {
  FileModel({
    this.name,
    this.url,
    this.type,
    this.size,
  });

  String name;
  String url;
  String type;
  int size;

  factory FileModel.fromJson(Map<String, dynamic> json) => FileModel(
        name: json["name"],
        url: json["url"],
        type: json["type"],
        size: json["size"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "type": type,
        "size": size,
      };
}
