// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

List<UsersModel> usersModelFromJson(String str) => List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String usersModelToJson(List<UsersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
  UsersModel({
    required this.id,
    required  this.name,
    required  this.email,
    required  this.phone,
    required  this.parentId,
    required  this.type,
    this.latitude,
    this.longitude,
    required this.rate,
    required  this.status,
    required this.active,
    this.enableNotification,
    this.logo,
    this.country,
    this.state,
    this.region,
    required  this.createDates,
    required  this.updateDates,
  });

  int id;
  String name;
  String email;
  String phone;
  int parentId;
  String type;
  dynamic latitude;
  dynamic longitude;
  int rate;
  String status;
  int active;
  dynamic enableNotification;
  dynamic logo;
  dynamic country;
  dynamic state;
  dynamic region;
  CreateDates createDates;
  UpdateDates updateDates;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    parentId: json["parent_id"],
    type: json["type"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    rate: json["rate"],
    status: json["status"],
    active: json["active"],
    enableNotification: json["enable_notification"],
    logo: json["logo"],
    country: json["country"],
    state: json["state"],
    region: json["region"],
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "parent_id": parentId,
    "type": type,
    "latitude": latitude,
    "longitude": longitude,
    "rate": rate,
    "status": status,
    "active": active,
    "enable_notification": enableNotification,
    "logo": logo,
    "country": country,
    "state": state,
    "region": region,
    "create_dates": createDates.toJson(),
    "update_dates": updateDates.toJson(),
  };
}

class CreateDates {
  CreateDates({
    required  this.createdAtHuman,
    required  this.createdAt,
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
    required  this.updatedAtHuman,
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
