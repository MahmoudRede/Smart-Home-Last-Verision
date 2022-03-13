// To parse this JSON data, do
//
//     final userRoomModel = userRoomModelFromJson(jsonString);

import 'dart:convert';

List<UserRoomModel> userRoomModelFromJson(String str) => List<UserRoomModel>.from(json.decode(str).map((x) => UserRoomModel.fromJson(x)));

String userRoomModelToJson(List<UserRoomModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserRoomModel {
  UserRoomModel({
    required this.id,
    required this.active,
    required this.user,
    required this.room,
    required this.devices,
    required  this.createDates,
    required  this.updateDates,
  });

  int id;
  int active;
  User user;
  Room room;
  dynamic devices;
  CreateDates createDates;
  UpdateDates updateDates;

  factory UserRoomModel.fromJson(Map<String, dynamic> json) => UserRoomModel(
    id: json["id"],
    active: json["active"],
    user: User.fromJson(json["user"]),
    room: Room.fromJson(json["room"]),
     devices:json["devices"],
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "user": user.toJson(),
    "room": room.toJson(),
    "devices":devices,
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

class Room {
  Room({
    required this.id,
    required  this.name,
    required  this.nameAr,
    required this.nameEn,
    required  this.logo,
    required  this.createDates,
    required   this.updateDates,
  });

  int id;
  String name;
  String nameAr;
  String nameEn;
  String logo;
  CreateDates createDates;
  UpdateDates updateDates;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
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

class UpdateDates {
  UpdateDates({
    required  this.updatedAtHuman,
    required this.updatedAt,
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
    required  this.id,
    required  this.name,
    required this.email,
    required this.phone,
    required  this.type,
    this.latitude,
    this.longitude,
    required this.rate,
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
