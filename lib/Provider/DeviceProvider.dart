import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Models/AlarmModel.dart';
import 'package:fssmarthome/Models/DeviceModel.dart';
import 'package:fssmarthome/Models/DeviceRealModel.dart';
import 'package:fssmarthome/Models/HomeDevicesModel.dart';
import 'package:fssmarthome/Models/RoomDevicesModel.dart';
import 'package:fssmarthome/Models/TimingModel.dart';
import 'package:fssmarthome/Models/UserRoomModel.dart';
import 'package:fssmarthome/Models/VoiceModel.dart';
import 'package:fssmarthome/Provider/ServicesConfig.dart';
import 'package:fssmarthome/Views/Custom/GlobalFunction.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:http/http.dart'as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class DeviceProvider extends ChangeNotifier{
  List <DeviceModel> devices=[];
  List <HomeDevicesModel> homeDevices=[];
  List <RoomDevicesModel> roomDevices=[];
  List<TimingModel>times=[];
  List<VoiceModel>voices=[];
  Map<String,dynamic>info={};
  late int SelectedIndex=0;
  late DeviceRealModel deviceRealModel;
  List<DeviceRealModel>devicesReal=[];
  List<AlarmModel>alarms=[];
  setReal(List<DeviceRealModel>_devicesReal){
    this.devicesReal=_devicesReal;
    notifyListeners();
  }
  set_Seleceted_index(int id){
    print(id);
    print("********************************************************************************************");
    this.SelectedIndex=id;
    notifyListeners();
  }
  RoomDevicesModel roomDevicesModel=new RoomDevicesModel(id: 0, active: 0, readingType: "", reading: "", relay: "0", eventValue: "", eventAction: "0", userRoom: "", device: "", createDates: "", updateDates: "",doorType: "",eventValue2: "",relay2: "",
  relay3: "",relay4: "",switch1: "",switch2: "",switch3: "",switch4: "");
  int room_id=0;
  int connection=0;
  setRoom(int id){
    room_id=id;
    notifyListeners();
  }
  setRoomDevice(RoomDevicesModel roomDevices){
    roomDevicesModel=roomDevices;
    notifyListeners();
  }
  UpdateRealDevice(int index,DeviceRealModel deviceRealModel){
    this.roomDevices[index].relay=deviceRealModel.relay.toString();
    this.roomDevices[index].active=deviceRealModel.active;
    this.roomDevices[index].reading=deviceRealModel.reading;
    this.roomDevices[index].readingType=deviceRealModel.reading_type;
    this.roomDevices[index].eventValue=deviceRealModel.event_value;
    this.roomDevices[index].eventAction=deviceRealModel.event_action;
    notifyListeners();
    this.UpdateDeviceData(this.roomDevices[index]);
  }
  Future<void>getDevices()async {
    var body=GlobalFunction.getBody(30, 0, "id", "ASC", "all", "false", "true", [], [], []);
    var url=ServicesConfig.base_url+"/devices/$body";
    var header=await ServicesConfig.getHeaderWithToken();
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        print("enter ");
        print(json.decode(utf8.decode(response.bodyBytes))["data"]);

        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"]["data"];
        devices = slideritems.map((e) => DeviceModel.fromJson(e)).toList();
        print(devices.length);
        print("devicesdevicesdevicesdevicesdevicesdevicesdevices");
        notifyListeners();
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<void>AddDevice(File fileImage,BuildContext context,String name_en,String name_ar)async
  {
    if (fileImage != null) {
      try {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        Dio dio = Dio();
        dio.options.headers['Content-Type'] = 'application/json';
        dio.options.headers['Authorization'] = "Bearer "+sharedPreferences.getString("token")!;
        ///we used uri.encode to enable upload  image with arabic name
        // var url =Uri.encodeFull(createPath('user/editProfileImage'));
        var url = "${ServicesConfig.base_url}//rooms";
        print(url);
        String fileName = basename(fileImage.path);
        // print('${fileName},,,,fileName');
        //print('${pathImage.path},,,,imagePath.path');

        FormData formData = FormData.fromMap({
          "photo": await MultipartFile.fromFile(
              fileImage.path, filename: fileName
              , contentType: MediaType('image', fileName
              .split('.')
              .last)),
          "name_ar":name_ar,
          "name_en":name_en,
        });
        print(formData.fields);
        print("ssssssssssssssssss");
        Response response = await dio.post(url, data: formData);
        print('${response.data},,,,,,,,fields');
        if (response.statusCode == 200) {
          Map<String, dynamic>map = response.data;
          FlutterToastr.show("Room Has Been Added", context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.center);
          notifyListeners();
        }
        else {
          return null;
        }
      }
      catch (e) {
        print('${e}imageuploaderror');
      }
    }
    else {
      FlutterToastr.show("Please Send Correct Image", context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.center);
    }}
  Future<void>getRoomDevices(var room_id)async {
    print(room_id);
    print("44444444444444444444444444444444444444444444444");
    var body=GlobalFunction.getBody(30, 0, "id", "ASC", "all", "false", "true", ["userRoom_id"], ["="], ["$room_id"]);
    var url=ServicesConfig.base_url+"/userroomdevices/$body";
    var header=await ServicesConfig.getHeaderWithToken();
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        print("getRoomDevices getRoomDevices getRoomDevices ");
        print(json.decode(utf8.decode(response.bodyBytes))["data"]);

        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"]["data"];
        roomDevices = slideritems.map((e) => RoomDevicesModel.fromJson(e)).toList();
        print(roomDevices.length);
        print("roomDevicesroomDevicesroomDevicesroomDevicesroomDevicesroomDevices");
        notifyListeners();
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<void>getHomeDevices(var body)async {
    print(body);
    print("******************************************");
    var url=ServicesConfig.base_url+"/userroomdevices/last_devices/$body";
    print(url);
    var header=await ServicesConfig.getHeaderWithToken();
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      print(response.body);
      print("responce deviciessssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
      if(response.statusCode==200 && response.body!=null)
      {
        print(json.decode(utf8.decode(response.bodyBytes))["data"]["data"]);
        print("getHomeDevices********************************************************");
        print(json.decode(utf8.decode(response.bodyBytes))["data"]["data"]);

        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"]["data"];
        print(slideritems.length);
        print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        roomDevices = slideritems.map((e) => RoomDevicesModel.fromJson(e)).toList();
        print(homeDevices.length);
        print("getHomeDevices getHomeDevices getHomeDevices getHomeDevices");
        notifyListeners();
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<void>getUserDevices(var user_id)async{
    var body=GlobalFunction.getBody(30, 0, "id", "ASC", "all", "false", "true", ["user_id"], ["="], ["$user_id"]);
    var url=ServicesConfig.base_url+"/userroomdevices/$body";
    print(url);
    var header=await ServicesConfig.getHeaderWithToken();
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        print("getRoomDevices getRoomDevices getRoomDevices ");
        print(json.decode(utf8.decode(response.bodyBytes))["data"]);

        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"]["data"];
        roomDevices = slideritems.map((e) => RoomDevicesModel.fromJson(e)).toList();
        print(roomDevices.length);
        print("roomDevicesroomDevicesroomDevicesroomDevicesroomDevicesroomDevices");
        notifyListeners();
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<void> UpdateDeviceData(RoomDevicesModel roomDevicesModel) async{
    String url=ServicesConfig.base_url+"/userroomdevices/${roomDevicesModel.id}";
    print(url);
    var body={
      "userRoom_id" : roomDevicesModel.userRoom["id"].toString(),
      "device_id":roomDevicesModel.device.id.toString(),
      "_method":"PUT",
      "active":roomDevicesModel.active.toString(),
      "reading":roomDevicesModel.reading.toString(),
      "reading_type":roomDevicesModel.readingType.toString(),
      "relay":roomDevicesModel.relay.toString(),
      "event_value":roomDevicesModel.eventValue.toString(),
      "event_action":roomDevicesModel.eventAction.toString(),
      "relay_2":roomDevicesModel.relay2.toString(),
      "relay_3":roomDevicesModel.relay3.toString(),
      "relay_4":roomDevicesModel.relay4.toString(),
      "eventValue2":roomDevicesModel.eventValue2.toString(),
    };
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      print("resproneee updateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        print(connection);
        print("updateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> UpdateDoor(var id,var door_type) async{
    String url=ServicesConfig.base_url+"/userroomdevices/${id}";
    print(url);
    var body={
      "door_type" : door_type.toString(),
    };
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.put(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      print("resproneee update doooooooooooooooooooooooooor");
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        print(connection);
        print("updateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> UpdateSwitch(var reading,var id) async{
    String url=ServicesConfig.base_url+"/userroomdevices/${id}";
    print(url);
    var body={
      "reading" : reading.toString(),
    };
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.put(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      print("resproneee update Switchhhhhhhhhhhhhhhhhhhhh");
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        print(connection);
        print("updateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> AddDeviceToRoom(String device_id) async{
    String url=ServicesConfig.base_url+"/userroomdevices";
    print(url);
    var body={
      "userRoom_id" : room_id.toString(),
      "device_id":device_id
      };
       print(body);
     var header=await ServicesConfig.getHeader();
     try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        info=json.decode(responce.body);
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> UpdateDevice(String device_id) async{
    String url=ServicesConfig.base_url+"/userroomdevices";
    print(url);
    var body={
      "userRoom_id" : room_id.toString(),
      "device_id":device_id
    };
    print(body);
    var header=await ServicesConfig.getHeader();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> AddTiming(var start_time,var userRoomDevice_id,var end_time,var event_action,var device_action,List<String>days) async
  {
    String url=ServicesConfig.base_url+"/time";
    print(url);
    var body={
      "start_time" : start_time,
      "userRoomDevice_id":userRoomDevice_id,
      "end_time":end_time,
      "event_action":event_action.toString(),
      "device_action":device_action.toString()
    };
    for (int i=0;i<days.length;i++){
     body.addAll({"days["+i.toString()+"]":days[i]});
    }
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> editTiming(var id,var start_time,var userRoomDevice_id,var end_time,var event_action,var device_action,List<String>days) async
  {
    String url=ServicesConfig.base_url+"/time/$id";
    print(url);
    var body={
      "_method":"PUT",
      "start_time" : start_time,
      "userRoomDevice_id":userRoomDevice_id,
      "end_time":end_time,
      "event_action":event_action.toString(),
      "device_action":device_action.toString()
    };
    for (int i=0;i<days.length;i++){
      body.addAll({"days["+i.toString()+"]":days[i]});
    }
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> deleteDevice(var id) async{
    String url=ServicesConfig.base_url+"/userroomdevices/bulkDelete?ids[]=$id";
    print(url);
    var header=await ServicesConfig.getHeader();
    try{
      final responce=await http.delete(Uri.parse(url),headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void>getTiming()async {
    var body=GlobalFunction.getBody(5000, 0, "id", "ASC", "all", "false", "true", [], [], []);
    var url=ServicesConfig.base_url+"/time/$body";
    var header=await ServicesConfig.getHeaderWithToken();
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        print("enter ");
        print(json.decode(utf8.decode(response.bodyBytes))["data"]);

        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"]["data"];
        times = slideritems.map((e) => TimingModel.fromJson(e)).toList();
        print(times.length);
        print("times times times times times times times");
        notifyListeners();
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<void> deleteTiming(var id) async{
    String url=ServicesConfig.base_url+"/time/bulkDelete?ids[]=$id";
    print(url);
    var header=await ServicesConfig.getHeader();
    try{
      final responce=await http.delete(Uri.parse(url),headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> AddVoice(var phrase,var userRoomDevice_id,var phrase_open,var phrase_close) async{
    String url=ServicesConfig.base_url+"/voice";
    print(url);
    var body={
      "phrase" : phrase,
      "userRoomDevice_id":userRoomDevice_id,
      "phrase_open":phrase_open,
      "phrase_close":phrase_close,
    };
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        info=json.decode(responce.body);
        connection=responce.statusCode;
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> UpdateVoice(var id,var phrase,var userRoomDevice_id,var phrase_open,var phrase_close) async{
    String url=ServicesConfig.base_url+"/voice/$id";
    print(url);
    var body={
      "_method":"PUT",
      "phrase" : phrase,
      "userRoomDevice_id":userRoomDevice_id,
      "phrase_open":phrase_open,
      "phrase_close":phrase_close,
    };
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        info=json.decode(responce.body);
        connection=responce.statusCode;
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void>getVoices()async {
    var body=GlobalFunction.getBody(5000, 0, "id", "ASC", "all", "false", "true", ["user_id"], ["="], [MyApp.user_id]);
    var url=ServicesConfig.base_url+"/voice/$body";
    var header=await ServicesConfig.getHeaderWithToken();
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        print("enter ");
        print(json.decode(utf8.decode(response.bodyBytes))["data"]);

        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"]["data"];
        voices = slideritems.map((e) => VoiceModel.fromJson(e)).toList();
        print(voices.length);
        print("voices voices voices voices voices voices voices");
        notifyListeners();
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<void> deleteVoice(var id) async{
    String url=ServicesConfig.base_url+"/voice/bulkDelete?ids[]=$id";
    print(url);
    var header=await ServicesConfig.getHeader();
    try{
      final responce=await http.delete(Uri.parse(url),headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> addAlarm(var userRoomDevice_id,var time,var notify) async{
    String url=ServicesConfig.base_url+"/alarm";
    print(url);
    var body={
      "time" : time,
      "notify":notify,
      "userRoomDevice_id":userRoomDevice_id.toString(),
    };
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      print("resproneee alarmalarmalarmalarm");
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        print(connection);
        print("updateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeealarmalarmalarmalarm");
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void>getAlarms(var userRoomDevice_id)async{
    var body=GlobalFunction.getBody(30, 0, "id", "ASC", "all", "false", "true", ["userRoomDevice_id"], ["="], ["$userRoomDevice_id"]);
    var url=ServicesConfig.base_url+"/alarm/$body";
    print(url);
    var header=await ServicesConfig.getHeaderWithToken();
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        print("getRoomDevices getRoomDevices getRoomDevices ");
        print(json.decode(utf8.decode(response.bodyBytes))["data"]);

        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"]["data"];
        alarms = slideritems.map((e) => AlarmModel.fromJson(e)).toList();
        print(alarms.length);
        print("alarmsalarmsalarmsalarmsalarmsalarmsalarmsalarmsalarmsalarmsalarmsalarms");
        notifyListeners();
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<void> UpdateAlarm(AlarmModel alarmModel) async{
    String url=ServicesConfig.base_url+"/alarm/${alarmModel.id}";
    print(url);
    var body={
      "active" : alarmModel.active.toString(),
      "notify":alarmModel.notify.toString(),
      "_method":"PUT",
      "time":alarmModel.time,
      "userRoomDevice_id":alarmModel.userRoomDeviceId.toString()
    };
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.put(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      print("resproneee alarmalarmalarmalarm");
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        print(connection);
        print("updateeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeealarmalarmalarmalarm");
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
}