class UserAssignRoom {
  bool? success;
  String? message;
  Data? data;

  UserAssignRoom({this.success, this.message, this.data});

  UserAssignRoom.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  Null? active;
  Null? user;
  UserRoom? userRoom;
  UserRoomDevice? userRoomDevice;
  CreateDates? createDates;
  UpdateDates? updateDates;

  Data(
      {this.id,
        this.active,
        this.user,
        this.userRoom,
        this.userRoomDevice,
        this.createDates,
        this.updateDates});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    user = json['user'];
    userRoom = json['userRoom'] != null
        ? new UserRoom.fromJson(json['userRoom'])
        : null;
    userRoomDevice = json['userRoomDevice'] != null
        ? new UserRoomDevice.fromJson(json['userRoomDevice'])
        : null;
    createDates = json['create_dates'] != null
        ? new CreateDates.fromJson(json['create_dates'])
        : null;
    updateDates = json['update_dates'] != null
        ? new UpdateDates.fromJson(json['update_dates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['user'] = this.user;
    if (this.userRoom != null) {
      data['userRoom'] = this.userRoom!.toJson();
    }
    if (this.userRoomDevice != null) {
      data['userRoomDevice'] = this.userRoomDevice!.toJson();
    }
    if (this.createDates != null) {
      data['create_dates'] = this.createDates!.toJson();
    }
    if (this.updateDates != null) {
      data['update_dates'] = this.updateDates!.toJson();
    }
    return data;
  }
}

class UserRoom {
  int? id;
  int? active;
  User? user;
  Room? room;
  int? devices;
  CreateDates? createDates;
  UpdateDates? updateDates;

  UserRoom(
      {this.id,
        this.active,
        this.user,
        this.room,
        this.devices,
        this.createDates,
        this.updateDates});

  UserRoom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    room = json['room'] != null ? new Room.fromJson(json['room']) : null;
    devices = json['devices'];
    createDates = json['create_dates'] != null
        ? new CreateDates.fromJson(json['create_dates'])
        : null;
    updateDates = json['update_dates'] != null
        ? new UpdateDates.fromJson(json['update_dates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.room != null) {
      data['room'] = this.room!.toJson();
    }
    data['devices'] = this.devices;
    if (this.createDates != null) {
      data['create_dates'] = this.createDates!.toJson();
    }
    if (this.updateDates != null) {
      data['update_dates'] = this.updateDates!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  Null? parentId;
  String? type;
  Null? latitude;
  Null? longitude;
  int? rate;
  String? status;
  int? active;
  Null? enableNotification;
  Null? logo;
  Null? country;
  Null? state;
  Null? region;
  CreateDates? createDates;
  UpdateDates? updateDates;

  User(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.parentId,
        this.type,
        this.latitude,
        this.longitude,
        this.rate,
        this.status,
        this.active,
        this.enableNotification,
        this.logo,
        this.country,
        this.state,
        this.region,
        this.createDates,
        this.updateDates});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    parentId = json['parent_id'];
    type = json['type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    rate = json['rate'];
    status = json['status'];
    active = json['active'];
    enableNotification = json['enable_notification'];
    logo = json['logo'];
    country = json['country'];
    state = json['state'];
    region = json['region'];
    createDates = json['create_dates'] != null
        ? new CreateDates.fromJson(json['create_dates'])
        : null;
    updateDates = json['update_dates'] != null
        ? new UpdateDates.fromJson(json['update_dates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['parent_id'] = this.parentId;
    data['type'] = this.type;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['rate'] = this.rate;
    data['status'] = this.status;
    data['active'] = this.active;
    data['enable_notification'] = this.enableNotification;
    data['logo'] = this.logo;
    data['country'] = this.country;
    data['state'] = this.state;
    data['region'] = this.region;
    if (this.createDates != null) {
      data['create_dates'] = this.createDates!.toJson();
    }
    if (this.updateDates != null) {
      data['update_dates'] = this.updateDates!.toJson();
    }
    return data;
  }
}

class CreateDates {
  String? createdAtHuman;
  String? createdAt;

  CreateDates({this.createdAtHuman, this.createdAt});

  CreateDates.fromJson(Map<String, dynamic> json) {
    createdAtHuman = json['created_at_human'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at_human'] = this.createdAtHuman;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class UpdateDates {
  String? updatedAtHuman;
  String? updatedAt;

  UpdateDates({this.updatedAtHuman, this.updatedAt});

  UpdateDates.fromJson(Map<String, dynamic> json) {
    updatedAtHuman = json['updated_at_human'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['updated_at_human'] = this.updatedAtHuman;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Room {
  int? id;
  String? name;
  String? nameAr;
  String? nameEn;
  int? userId;
  String? logo;
  CreateDates? createDates;
  UpdateDates? updateDates;

  Room(
      {this.id,
        this.name,
        this.nameAr,
        this.nameEn,
        this.userId,
        this.logo,
        this.createDates,
        this.updateDates});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    userId = json['user_id'];
    logo = json['logo'];
    createDates = json['create_dates'] != null
        ? new CreateDates.fromJson(json['create_dates'])
        : null;
    updateDates = json['update_dates'] != null
        ? new UpdateDates.fromJson(json['update_dates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['user_id'] = this.userId;
    data['logo'] = this.logo;
    if (this.createDates != null) {
      data['create_dates'] = this.createDates!.toJson();
    }
    if (this.updateDates != null) {
      data['update_dates'] = this.updateDates!.toJson();
    }
    return data;
  }
}

class UserRoomDevice {
  int? id;
  int? active;
  String? readingType;
  String? reading;
  String? bother;
  String? relay;
  String? relay2;
  String? relay3;
  String? relay4;
  String? doorType;
  int? switch1;
  int? switch2;
  int? switch3;
  int? switch4;
  String? eventValue;
  String? eventValue2;
  String? eventAction;
  UserRoom? userRoom;
  Device? device;
  CreateDates? createDates;
  UpdateDates? updateDates;

  UserRoomDevice(
      {this.id,
        this.active,
        this.readingType,
        this.reading,
        this.bother,
        this.relay,
        this.relay2,
        this.relay3,
        this.relay4,
        this.doorType,
        this.switch1,
        this.switch2,
        this.switch3,
        this.switch4,
        this.eventValue,
        this.eventValue2,
        this.eventAction,
        this.userRoom,
        this.device,
        this.createDates,
        this.updateDates});

  UserRoomDevice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    readingType = json['reading_type'];
    reading = json['reading'];
    bother = json['bother'];
    relay = json['relay'];
    relay2 = json['relay_2'];
    relay3 = json['relay_3'];
    relay4 = json['relay_4'];
    doorType = json['door_type'];
    switch1 = json['switch_1'];
    switch2 = json['switch_2'];
    switch3 = json['switch_3'];
    switch4 = json['switch_4'];
    eventValue = json['event_value'];
    eventValue2 = json['event_value_2'];
    eventAction = json['event_action'];
    userRoom = json['userRoom'] != null
        ? new UserRoom.fromJson(json['userRoom'])
        : null;
    device =
    json['device'] != null ? new Device.fromJson(json['device']) : null;
    createDates = json['create_dates'] != null
        ? new CreateDates.fromJson(json['create_dates'])
        : null;
    updateDates = json['update_dates'] != null
        ? new UpdateDates.fromJson(json['update_dates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['reading_type'] = this.readingType;
    data['reading'] = this.reading;
    data['bother'] = this.bother;
    data['relay'] = this.relay;
    data['relay_2'] = this.relay2;
    data['relay_3'] = this.relay3;
    data['relay_4'] = this.relay4;
    data['door_type'] = this.doorType;
    data['switch_1'] = this.switch1;
    data['switch_2'] = this.switch2;
    data['switch_3'] = this.switch3;
    data['switch_4'] = this.switch4;
    data['event_value'] = this.eventValue;
    data['event_value_2'] = this.eventValue2;
    data['event_action'] = this.eventAction;
    if (this.userRoom != null) {
      data['userRoom'] = this.userRoom!.toJson();
    }
    if (this.device != null) {
      data['device'] = this.device!.toJson();
    }
    if (this.createDates != null) {
      data['create_dates'] = this.createDates!.toJson();
    }
    if (this.updateDates != null) {
      data['update_dates'] = this.updateDates!.toJson();
    }
    return data;
  }
}

class Device {
  int? id;
  String? name;
  String? nameAr;
  String? nameEn;
  String? logo;
  Null? userId;
  CreateDates? createDates;
  UpdateDates? updateDates;

  Device(
      {this.id,
        this.name,
        this.nameAr,
        this.nameEn,
        this.logo,
        this.userId,
        this.createDates,
        this.updateDates});

  Device.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameAr = json['name_ar'];
    nameEn = json['name_en'];
    logo = json['logo'];
    userId = json['user_id'];
    createDates = json['create_dates'] != null
        ? new CreateDates.fromJson(json['create_dates'])
        : null;
    updateDates = json['update_dates'] != null
        ? new UpdateDates.fromJson(json['update_dates'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_ar'] = this.nameAr;
    data['name_en'] = this.nameEn;
    data['logo'] = this.logo;
    data['user_id'] = this.userId;
    if (this.createDates != null) {
      data['create_dates'] = this.createDates!.toJson();
    }
    if (this.updateDates != null) {
      data['update_dates'] = this.updateDates!.toJson();
    }
    return data;
  }
}