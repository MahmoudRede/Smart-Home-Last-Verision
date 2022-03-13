// To parse this JSON data, do
//
//     final roomDevicesModel = roomDevicesModelFromJson(jsonString);

import 'dart:convert';

List<RoomDevicesModel> roomDevicesModelFromJson(String str) => List<RoomDevicesModel>.from(json.decode(str).map((x) => RoomDevicesModel.fromJson(x)));

String roomDevicesModelToJson(List<RoomDevicesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RoomDevicesModel {
  RoomDevicesModel({
    required this.id,
    required  this.active,
    required  this.readingType,
    required  this.reading,
    required  this.relay,
    required this.relay2,
    required this.relay3,
    required this.relay4,
    required  this.doorType,
    required  this.switch1,
    required  this.switch2,
    required  this.switch3,
    required  this.switch4,
    required this.eventValue,
    required this.eventValue2,
    required this.eventAction,
    this.userRoom,
    required  this.device,
    required  this.createDates,
    required  this.updateDates,
  });

  int id;
  int active;
  dynamic readingType;
  dynamic reading;
  dynamic relay;
  dynamic relay2;
  dynamic relay3;
  dynamic relay4;
  dynamic doorType;
  dynamic switch1;
  dynamic switch2;
  dynamic switch3;
  dynamic switch4;
  dynamic eventValue;
  dynamic eventValue2;
  dynamic eventAction;
  dynamic userRoom;
  dynamic device;
  dynamic createDates;
  dynamic updateDates;

  factory RoomDevicesModel.fromJson(Map<String, dynamic> json) => RoomDevicesModel(
    id: json["id"],
    active: json["active"],
    readingType: json["reading_type"],
    reading: json["reading"],
    relay: json["relay"],
    relay2: json["relay_2"],
    relay3: json["relay_3"],
    relay4: json["relay_4"],
    doorType: json["door_type"],
    switch1: json["switch_1"],
    switch2: json["switch_2"],
    switch3: json["switch_3"],
    switch4: json["switch_4"],
    eventValue: json["event_value"],
    eventValue2: json["event_value_2"],
    eventAction: json["event_action"],
    userRoom: json["userRoom"],
    device:json["device"]==null?"": Device.fromJson(json["device"]),
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "reading_type": readingType,
    "reading": reading,
    "relay": relay,
    "relay_2": relay2,
    "relay_3": relay3,
    "relay_4": relay4,
    "door_type": doorType,
    "switch_1": switch1,
    "switch_2": switch2,
    "switch_3": switch3,
    "switch_4": switch4,
    "event_value": eventValue,
    "event_value_2": eventValue2,
    "event_action": eventAction,
    "userRoom": userRoom,
    "device": device.toJson(),
    "create_dates": createDates.toJson(),
    "update_dates": updateDates.toJson(),
  };
}

class CreateDates {
  CreateDates({
    required this.createdAtHuman,
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
    required   this.nameAr,
    required   this.nameEn,
    required   this.logo,
    this.userId,
    required   this.createDates,
    required  this.updateDates,
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
