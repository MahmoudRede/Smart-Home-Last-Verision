// To parse this JSON data, do
//
//     final remoteModel = remoteModelFromJson(jsonString);

import 'dart:convert';

List<RemoteModel> remoteModelFromJson(String str) => List<RemoteModel>.from(json.decode(str).map((x) => RemoteModel.fromJson(x)));

String remoteModelToJson(List<RemoteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RemoteModel {
  RemoteModel({
    required  this.id,
    required  this.name,
    required  this.plusbtn,
    required  this.minusbtn,
    required  this.upbtn,
    required  this.downbtn,
    required  this.okbtn,
    required  this.powerbtn,
    required  this.segmant,
    required  this.flag,
    required  this.userId,
    required  this.user,
    required  this.active,
    required  this.createDates,
    required this.updateDates,
  });

  int id;
  String name;
  String plusbtn;
  String minusbtn;
  String upbtn;
  String downbtn;
  String okbtn;
  String powerbtn;
  String segmant;
  String flag;
  int userId;
  User user;
  int active;
  CreateDates createDates;
  UpdateDates updateDates;

  factory RemoteModel.fromJson(Map<String, dynamic> json) => RemoteModel(
    id: json["id"],
    name: json["name"],
    plusbtn: json["plusbtn"],
    minusbtn: json["minusbtn"],
    upbtn: json["upbtn"],
    downbtn: json["downbtn"],
    okbtn: json["okbtn"],
    powerbtn: json["powerbtn"],
    segmant: json["segmant"],
    flag: json["flag"],
    userId: json["user_id"],
    user: User.fromJson(json["user"]),
    active: json["active"],
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "plusbtn": plusbtn,
    "minusbtn": minusbtn,
    "upbtn": upbtn,
    "downbtn": downbtn,
    "okbtn": okbtn,
    "powerbtn": powerbtn,
    "segmant": segmant,
    "flag": flag,
    "user_id": userId,
    "user": user.toJson(),
    "active": active,
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
    required  this.updatedAtHuman,
    required   this.updatedAt,
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

class User {
  User({
    required this.id,
    required   this.name,
    required this.email,
    this.phone,
    this.parentId,
    required this.type,
    this.latitude,
    this.longitude,
    required  this.rate,
    required  this.status,
    required  this.active,
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
  dynamic phone;
  dynamic parentId;
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
