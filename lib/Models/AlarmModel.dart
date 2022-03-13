// To parse this JSON data, do
//
//     final alarmModel = alarmModelFromJson(jsonString);

import 'dart:convert';

List<AlarmModel> alarmModelFromJson(String str) => List<AlarmModel>.from(json.decode(str).map((x) => AlarmModel.fromJson(x)));

String alarmModelToJson(List<AlarmModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlarmModel {
  AlarmModel({
    required  this.id,
    required  this.time,
    required  this.userRoomDeviceId,
    required  this.userRoomDevice,
    required this.notify,
    required this.active,
    required this.createDates,
    required this.updateDates,
  });

  int id;
  String time;
  int userRoomDeviceId;
  UserRoomDevice userRoomDevice;
  String notify;
  int active;
  CreateDates createDates;
  UpdateDates updateDates;

  factory AlarmModel.fromJson(Map<String, dynamic> json) => AlarmModel(
    id: json["id"],
    time: json["time"],
    userRoomDeviceId: json["userRoomDevice_id"],
    userRoomDevice: UserRoomDevice.fromJson(json["userRoomDevice"]),
    notify: json["notify"],
    active: json["active"],
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "time": time,
    "userRoomDevice_id": userRoomDeviceId,
    "userRoomDevice": userRoomDevice.toJson(),
    "notify": notify,
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

class UserRoomDevice {
  UserRoomDevice({
    required this.id,
    required this.active,
    required this.readingType,
    required  this.reading,
    required this.relay,
    required this.relay2,
    required  this.relay3,
    required  this.relay4,
    required this.doorType,
    required  this.switch1,
    required this.switch2,
    required this.switch3,
    required  this.switch4,
    required this.eventValue,
    required this.eventValue2,
    required this.eventAction,
    required  this.userRoom,
    required  this.device,
    required  this.createDates,
    required this.updateDates,
  });

  int id;
  int active;
  String readingType;
  String reading;
  String relay;
  String relay2;
  String relay3;
  String relay4;
  String doorType;
  int switch1;
  int switch2;
  int switch3;
  int switch4;
  String eventValue;
  String eventValue2;
  String eventAction;
  UserRoom userRoom;
  Device device;
  CreateDates createDates;
  UpdateDates updateDates;

  factory UserRoomDevice.fromJson(Map<String, dynamic> json) => UserRoomDevice(
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
    required  this.nameAr,
    required  this.nameEn,
    required  this.logo,
    this.userId,
    required  this.createDates,
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

class UserRoom {
  UserRoom({
    required this.id,
    required this.active,
    required  this.user,
    required  this.room,
    required  this.devices,
    required this.createDates,
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
    required  this.name,
    required  this.email,
    this.phone,
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
