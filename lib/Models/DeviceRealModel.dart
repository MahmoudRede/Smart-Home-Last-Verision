// To parse this JSON data, do
//
//     final deviceModel = deviceModelFromJson(jsonString);

import 'dart:convert';
List<DeviceRealModel> deviceModelFromJson(String str) => List<DeviceRealModel>.from(json.decode(str).map((x) => DeviceRealModel.fromJson(x)));
String deviceModelToJson(List<DeviceRealModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class DeviceRealModel {
  DeviceRealModel({
    required this.id,
    required  this.device_id,
    required  this.active,
    required this.relay,
    required this.updated_at,
    required this.userRoom_id,
    required this.event_action,
    required this.reading_type,
    required this.event_value,
    required this.reading,
    required this.door_type,
    required this.event_value_2,
    required this.relay_2,
    required this.relay_3,
    required this.relay_4,
    required this.switch_1,
    required this.switch_2,
    required this.switch_3,
    required this.switch_4,
  });
  dynamic device_id;
  String updated_at;
  dynamic userRoom_id;
  dynamic relay;
  dynamic active;
  dynamic id;
  dynamic event_action;
  dynamic event_value;
  dynamic reading;
  dynamic reading_type;
  dynamic door_type;
  dynamic event_value_2;
  dynamic relay_2;
  dynamic relay_3;
  dynamic relay_4;
  dynamic switch_1;
  dynamic  switch_2;
  dynamic switch_3;
  dynamic switch_4;
  factory DeviceRealModel.fromJson(Map<String, dynamic> json) => DeviceRealModel(
    id: json["id"],
    device_id: json["device_id"],
    updated_at: json["updated_at"],
    userRoom_id: json["userRoom_id"],
    relay: json["relay"],
    active: json["active"],
    event_action: json["event_action"],
    event_value: json["event_value"],
    reading: json["reading"],
    reading_type: json["reading_type"],
      event_value_2: json["event_value_2"],
      relay_2: json["relay_2"],
      relay_3: json["relay_3"],
      relay_4: json["relay_4"],
      switch_1: json["switch_1"],
      switch_2: json["switch_2"],
      switch_3: json["switch_3"],
      switch_4: json["switch_4"],
      door_type:json["door_type"],
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "device_id": device_id,
    "updated_at": updated_at,
    "userRoom_id": userRoom_id,
    "relay": relay,
    "active": active,
    "event_action": event_action,
    "event_value": event_value,
    "reading": reading,
    "reading_type": reading_type,
    "event_value_2": event_value_2,
    "relay_2": relay_2,
    "relay_3": relay_3,
    "relay_4":relay_4,
    "switch_1": switch_1,
    "switch_2": switch_2,
    "switch_3": switch_3,
    "switch_4": switch_4,
    "door_type":door_type,
  };
}

