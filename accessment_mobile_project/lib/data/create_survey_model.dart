// To parse this JSON data, do
//
//     final createSurveyModel = createSurveyModelFromJson(jsonString);

import 'dart:convert';

CreateSurveyModel createSurveyModelFromJson(String str) =>
    CreateSurveyModel.fromJson(json.decode(str));

String createSurveyModelToJson(CreateSurveyModel data) =>
    json.encode(data.toJson());

class CreateSurveyModel {
  CreateSurveyModel({
    this.assessmentCategoryCode,
    this.contactPhone,
    this.customerCode,
    this.duration,
    this.estimatePrice,
    this.name,
    this.scene,
  });

  String assessmentCategoryCode;
  String contactPhone;
  String customerCode;
  int duration;
  int estimatePrice;
  String name;
  String scene;

  factory CreateSurveyModel.fromJson(Map<String, dynamic> json) =>
      CreateSurveyModel(
        assessmentCategoryCode: json["assessmentCategoryCode"],
        contactPhone: json["contactPhone"],
        customerCode: json["customerCode"],
        duration: json["duration"],
        estimatePrice: json["estimatePrice"],
        name: json["name"],
        scene: json["scene"],
      );

  Map<String, dynamic> toJson() => {
        "assessmentCategoryCode": assessmentCategoryCode,
        "contactPhone": contactPhone,
        "customerCode": customerCode,
        "duration": duration,
        "estimatePrice": estimatePrice,
        "name": name,
        "scene": scene,
      };
}
