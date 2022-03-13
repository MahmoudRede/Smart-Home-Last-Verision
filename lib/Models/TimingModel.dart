// To parse this JSON data, do
//
//     final timingModel = timingModelFromJson(jsonString);

import 'dart:convert';

List<TimingModel> timingModelFromJson(String str) => List<TimingModel>.from(json.decode(str).map((x) => TimingModel.fromJson(x)));

String timingModelToJson(List<TimingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TimingModel {
  TimingModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.eventAction,
    required this.deviceAction,
    required  this.userRoomDeviceId,
    required this.userRoomDevice,
    required this.days,
    required this.active,
    required this.createDates,
    required this.updateDates,
  });

  int id;
  String startTime;
  String endTime;
  String eventAction;
  String deviceAction;
  int userRoomDeviceId;
  UserRoomDevice userRoomDevice;
  List<String> days;
  int active;
  CreateDates createDates;
  UpdateDates updateDates;

  factory TimingModel.fromJson(Map<String, dynamic> json) => TimingModel(
    id: json["id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    eventAction: json["event_action"],
    deviceAction: json["device_action"],
    userRoomDeviceId: json["userRoomDevice_id"],
    userRoomDevice: UserRoomDevice.fromJson(json["userRoomDevice"]),
    days: List<String>.from(json["days"].map((x) => x)),
    active: json["active"],
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "start_time": startTime,
    "end_time": endTime,
    "event_action": eventAction,
    "device_action": deviceAction,
    "userRoomDevice_id": userRoomDeviceId,
    "userRoomDevice": userRoomDevice.toJson(),
    "days": List<dynamic>.from(days.map((x) => x)),
    "active": active,
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

class UserRoomDevice {
  UserRoomDevice({
    required this.id,
    required  this.active,
    this.readingType,
    this.reading,
    required  this.userRoom,
    required  this.device,
    required this.createDates,
    required this.updateDates,
  });

  int id;
  int active;
  dynamic readingType;
  dynamic reading;
  UserRoom userRoom;
  Device device;
  CreateDates createDates;
  UpdateDates updateDates;

  factory UserRoomDevice.fromJson(Map<String, dynamic> json) => UserRoomDevice(
    id: json["id"],
    active: json["active"],
    readingType: json["reading_type"],
    reading: json["reading"],
    userRoom: UserRoom.fromJson(json["userRoom"]),
    device: Device.fromJson(json["device"]),
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "active": active,
    "reading_type": readingType,
    "reading": reading,
    "userRoom": userRoom.toJson(),
    "device": device.toJson(),
    "create_dates": createDates.toJson(),
    "update_dates": updateDates.toJson(),
  };
}

class Device {
  Device({
    required this.id,
    required  this.name,
    required   this.nameAr,
    required   this.nameEn,
    required  this.logo,
    required this.createDates,
    required this.updateDates,
  });

  int id;
  String name;
  String nameAr;
  String nameEn;
  String logo;
  CreateDates createDates;
  UpdateDates updateDates;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
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

class UserRoom {
  UserRoom({
    required this.id,
    required this.active,
    required this.user,
    required this.room,
    required this.devices,
    required this.createDates,
    required this.updateDates,
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
    required  this.id,
    required this.name,
    required this.email,
    required  this.phone,
    required  this.type,
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
    required  this.createDates,
    required  this.updateDates,
  });

  int id;
  String name;
  String email;
  dynamic phone;
  dynamic type;
  dynamic latitude;
  dynamic longitude;
  int rate;
  dynamic status;
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
