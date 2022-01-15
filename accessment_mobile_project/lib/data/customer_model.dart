// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

import 'dart:typed_data';

List<CustomerModel> customerModelFromJson(Uint8List str) =>
    List<CustomerModel>.from(json
        .decode(utf8.decode(str))["content"]
        .map((x) => CustomerModel.fromJson(x)));

String customerModelToJson(List<CustomerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerModel {
  CustomerModel({
    this.id,
    this.version,
    this.createAt,
    this.updateAt,
    this.createdBy,
    this.lastModifiedBy,
    this.code,
    this.custNameVn,
    this.custNameIt,
    this.address,
    this.phone,
  });

  int id;
  int version;
  String createAt;
  String updateAt;
  String createdBy;
  String lastModifiedBy;
  String code;
  String custNameVn;
  String custNameIt;
  String address;
  String phone;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        id: json["id"],
        version: json["version"],
        createAt: json["createAt"],
        updateAt: json["updateAt"],
        createdBy: json["createdBy"],
        lastModifiedBy: json["lastModifiedBy"],
        code: json["code"],
        custNameVn: json["custNameVN"],
        custNameIt: json["custNameIT"],
        address: json["address"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "createAt": createAt,
        "updateAt": updateAt,
        "createdBy": createdBy,
        "lastModifiedBy": lastModifiedBy,
        "code": code,
        "custNameVN": custNameVn,
        "custNameIT": custNameIt,
        "address": address,
        "phone": phone,
      };
}
