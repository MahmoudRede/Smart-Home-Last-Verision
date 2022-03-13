// To parse this JSON data, do
//
//     final deviceModel = deviceModelFromJson(jsonString);

import 'dart:convert';
List<DeviceModel> deviceModelFromJson(String str) => List<DeviceModel>.from(json.decode(str).map((x) => DeviceModel.fromJson(x)));
String deviceModelToJson(List<DeviceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class DeviceModel {
  DeviceModel({
    required this.id,
    required  this.name,
    required  this.nameAr,
    required this.nameEn,
    required this.logo,
    required  this.createDates,
    required this.updateDates,
  });
  int id;
  dynamic name;
  dynamic nameAr;
  dynamic nameEn;
  dynamic logo;
  CreateDates createDates;
  UpdateDates updateDates;
  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
    id: json["id"],
    name: json["name"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    logo: json["logo"],
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_ar": nameAr,
    "name_en": nameEn,
    "logo": logo,
    "create_dates": createDates.toJson(),
    "update_dates": updateDates.toJson(),
  };
}
class CreateDates {
  CreateDates({
    required  this.createdAtHuman,
    required this.createdAt,
  });

  String createdAtHuman;
  DateTime createdAt;

  factory CreateDates.fromJson(Map<String, dynamic> json) => CreateDates(
    createdAtHuman: json["created_at_human"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "created_at_human": createdAtHuman,
    "created_at": createdAt.toIso8601String(),
  };
}
class UpdateDates {
  UpdateDates({
    required this.updatedAtHuman,
    required  this.updatedAt,
  });

  String updatedAtHuman;
  DateTime updatedAt;

  factory UpdateDates.fromJson(Map<String, dynamic> json) => UpdateDates(
    updatedAtHuman: json["updated_at_human"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "updated_at_human": updatedAtHuman,
    "updated_at": updatedAt.toIso8601String(),
  };
}
