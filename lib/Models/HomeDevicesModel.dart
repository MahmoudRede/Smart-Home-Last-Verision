// To parse this JSON data, do
//
//     final homeDevicesModel = homeDevicesModelFromJson(jsonString);

import 'dart:convert';

List<HomeDevicesModel> homeDevicesModelFromJson(String str) => List<HomeDevicesModel>.from(json.decode(str).map((x) => HomeDevicesModel.fromJson(x)));

String homeDevicesModelToJson(List<HomeDevicesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeDevicesModel {
  HomeDevicesModel({
    required  this.id,
    required this.active,
    required  this.readingType,
    required this.reading,
    required this.relay,
    required this.eventValue,
    required this.eventAction,
    required this.userRoom,
    required  this.device,
    required this.createDates,
    required this.updateDates,
  });

  int id;
  int active;
  String readingType;
  String reading;
  String relay;
  String eventValue;
  String eventAction;
  UserRoom userRoom;
  Device device;
  CreateDates createDates;
  UpdateDates updateDates;

  factory HomeDevicesModel.fromJson(Map<String, dynamic> json) => HomeDevicesModel(
    id: json["id"],
    active: json["active"],
    readingType: json["reading_type"],
    reading: json["reading"],
    relay: json["relay"],
    eventValue: json["event_value"],
    eventAction: json["event_action"],
    userRoom:  UserRoom.fromJson(json["userRoom"]),
    device: Device.fromJson(json["device"]),
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "reading_type": readingType,
    "reading": reading,
    "relay": relay,
    "event_value": eventValue,
    "event_action": eventAction,
    "userRoom": userRoom == null ? null : userRoom.toJson(),
    "device": device.toJson(),
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

class Device {
  Device({
    required  this.id,
    required  this.name,
    required  this.nameAr,
    required  this.nameEn,
    required this.logo,
    this.userId,
    required this.createDates,
    required this.updateDates,
  });

  int id;
  String name;
  String nameAr;
  String nameEn;
  String logo;
  dynamic userId;
  CreateDates createDates;
  UpdateDates updateDates;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
    id: json["id"],
    name: json["name"],
    nameAr: json["name_ar"],
    nameEn: json["name_en"],
    logo: json["logo"],
    userId: json["user_id"],
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_ar": nameAr,
    "name_en": nameEn,
    "logo": logo,
    "user_id": userId,
    "create_dates": createDates.toJson(),
    "update_dates": updateDates.toJson(),
  };
}

class UpdateDates {
  UpdateDates({
    required this.updatedAtHuman,
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

class UserRoom {
  UserRoom({
    required  this.id,
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
  Device room;
  int devices;
  CreateDates createDates;
  UpdateDates updateDates;

  factory UserRoom.fromJson(Map<String, dynamic> json) => UserRoom(
    id: json["id"],
    active: json["active"],
    user: User.fromJson(json["user"]),
    room: Device.fromJson(json["room"]),
    devices: json["devices"],
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "user": user.toJson(),
    "room": room.toJson(),
    "devices": devices,
    "create_dates": createDates.toJson(),
    "update_dates": updateDates.toJson(),
  };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.type,
    this.latitude,
    this.longitude,
    required this.rate,
    required this.status,
    required this.active,
    this.enableNotification,
    this.logo,
    this.country,
    this.state,
    this.region,
    required this.createDates,
    required this.updateDates,
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
