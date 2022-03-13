// To parse this JSON data, do
//
//     final voiceModel = voiceModelFromJson(jsonString);

import 'dart:convert';

List<VoiceModel> voiceModelFromJson(String str) => List<VoiceModel>.from(json.decode(str).map((x) => VoiceModel.fromJson(x)));

String voiceModelToJson(List<VoiceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VoiceModel {
  VoiceModel({
    required this.id,
    required this.phrase,
    required this.phraseOpen,
    required this.phraseClose,
    required this.userRoomDeviceId,
    required this.userRoomDevice,
    required this.active,
    required this.createDates,
    required this.updateDates,
  });

  int id;
  String phrase;
  String phraseOpen;
  String phraseClose;
  int userRoomDeviceId;
  dynamic userRoomDevice;
  dynamic active;
  dynamic createDates;
  dynamic updateDates;

  factory VoiceModel.fromJson(Map<String, dynamic> json) => VoiceModel(
    id: json["id"],
    phrase: json["phrase"],
    phraseOpen: json["phrase_open"],
    phraseClose: json["phrase_close"],
    userRoomDeviceId: json["userRoomDevice_id"],
    userRoomDevice: json["userRoomDevice"],
    active: json["active"],
    createDates: CreateDates.fromJson(json["create_dates"]),
    updateDates: UpdateDates.fromJson(json["update_dates"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phrase": phrase,
    "phrase_open": phraseOpen,
    "phrase_close": phraseClose,
    "userRoomDevice_id": userRoomDeviceId,
    "userRoomDevice": userRoomDevice.toJson(),
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



