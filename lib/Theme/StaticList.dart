import 'package:flutter/cupertino.dart';
import 'package:fssmarthome/Views/Devices/AddDevice.dart';
import 'package:fssmarthome/Views/Devices/Alarm.dart';
import 'package:fssmarthome/Views/Devices/Door.dart';
import 'package:fssmarthome/Views/Devices/FireDetector.dart';
import 'package:fssmarthome/Views/Devices/Motion.dart';
import 'package:fssmarthome/Views/Devices/SmokeDetector.dart';
import 'package:fssmarthome/Views/Devices/Soil.dart';
import 'package:fssmarthome/Views/Devices/Switch.dart';
import 'package:fssmarthome/Views/Devices/Temperature.dart';
import 'package:fssmarthome/Views/Devices/WaterLeak.dart';

class StaticList {



  static List <String> RoomImages=[
    "assets/images/rooms/bathroom.png",
    "assets/images/rooms/bedroom.png",
    "assets/images/rooms/diningRoom.png",
    "assets/images/rooms/gaming.png",
    "assets/images/rooms/garag.png",
    "assets/images/rooms/garden.png",
    "assets/images/rooms/kidsroom.png",
    "assets/images/rooms/kitchen.png",
    "assets/images/rooms/livingroom.png",
    "assets/images/rooms/study.png",
  ];
  static List <String> RoomNames=[
    "Bathroom",
    "Bedroom",
    "DiningRoom",
    "Gaming",
    "Garag",
    "Garden",
    "Kidsroom",
    "Kitchen",
    "Livingroom",
    "Study",
  ];
  static List <String> DevicesImages=[
    "assets/images/devices/knife-switch 1-dark.png",
    "assets/images/devices/motion.png",
    "assets/images/devices/alarm-clock 1.png",
    "assets/images/devices/fire.png",
    "assets/images/devices/smoke.png",
    "assets/images/devices/soil.png",
    "assets/images/devices/door mag.png",
    "assets/images/devices/tempreture.png",
    "assets/images/devices/water leak.png",
  ];
  static List <Widget> DevicesWidget=[
    SwitchDevice(),
    Motion(),
    Alarm(),
    FireDetector(),
    SmokeDetector(),
    Soil(),
    Door(),
    Temperature(),
    WaterLeak(),
    AddDevice(),
  ];
  static List <String> DevicesNames=[
    "Switch 1-2-3 channels",
    "Motion",
    "Alarm-Clock",
    "Fire Detector",
    "Smoke Detector",
    "Soil Moisture",
    "Door& Window Mognetic",
    "Temperature and humidity",
    "water leak",
  ];
  static List <bool> switchList=[
    true,
    false,
    true,
    true,
    false,
    true,
     false,
    true,
    false,
    true,
    false,
    true,
    false,
  ];
}