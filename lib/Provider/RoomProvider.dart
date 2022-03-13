import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Models/RoomModel.dart';
import 'package:fssmarthome/Models/UserRoomModel.dart';
import 'package:fssmarthome/Provider/ServicesConfig.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';
import 'package:http/http.dart'as http;

import 'package:shared_preferences/shared_preferences.dart';

class RoomProvider extends ChangeNotifier{
  List <UserRoomModel> rooms=[];
  List <RoomModel> allRooms=[];
  int connection=0;
  Map<String,dynamic>responceInfo={};
  Future<void>getUserRooms(var body)async {
    var url=ServicesConfig.base_url+"/userrooms/$body";
    print(url);
    var header=await ServicesConfig.getHeaderWithToken();
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      print(response.body);
      if(response.statusCode==200 && response.body!=null)
      {
        print("enter ");
        print(json.decode(utf8.decode(response.bodyBytes))["data"]);

        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"]["data"];
        rooms = slideritems.map((e) => UserRoomModel.fromJson(e)).toList();
        print(rooms.length);
        print("roomssssssssssssssssssssssssss");
        notifyListeners();
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<void>getRooms(var body)async {
    var url=ServicesConfig.base_url+"/myrooms/$body";
    print(url);
    var header=await ServicesConfig.getHeaderWithToken();
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      print(response.body);
      print("enter all Room qwwww111111111111111111111111111");
      if(response.statusCode==200 && response.body!=null)
      {
        print("enter all Room ");
        print(json.decode(utf8.decode(response.bodyBytes))["data"]);

        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"]["data"];
        allRooms = slideritems.map((e) => RoomModel.fromJson(e)).toList();
        print(allRooms.length);
        print("roomssssssssssssssssssssssssss");
        notifyListeners();
      }
    }
    catch(e)
    {
      print(e);
    }
  }
  Future<void> addRoomToUser(var user_id,var room_id) async{
    String url=ServicesConfig.base_url+"/userrooms";
    print(url);
    var body={
      "user_id":user_id.toString(),
      "room_id" : room_id.toString(),
    };
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        connection=responce.statusCode;
        responceInfo=json.decode(responce.body);
        print(responceInfo);
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void>AddRoom(File fileImage,BuildContext context,String name_en,String name_ar)async
  {
    if (fileImage != null) {
      try {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        Dio dio = Dio();
        dio.options.headers['Content-Type'] = 'application/json';
        dio.options.headers['Authorization'] = "Bearer "+sharedPreferences.getString("token")!;
        ///we used uri.encode to enable upload  image with arabic name
        // var url =Uri.encodeFull(createPath('user/editProfileImage'));
        var url = "${ServicesConfig.base_url}/rooms";
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
        connection=response.statusCode!;
         notifyListeners();
        if (response.statusCode == 200) {
          Map<String, dynamic>map = response.data;
          responceInfo=response.data;
          notifyListeners();
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
  Future<void>updateRoom(var id,File fileImage,BuildContext context,String name_en,String name_ar,var room_id,var user_id)async
  {
    if (fileImage != null) {
      try {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        Dio dio = Dio();
        dio.options.headers['Content-Type'] = 'application/json';
        dio.options.headers['Authorization'] = "Bearer "+sharedPreferences.getString("token")!;
        ///we used uri.encode to enable upload  image with arabic name
        // var url =Uri.encodeFull(createPath('user/editProfileImage'));
        var url = "${ServicesConfig.base_url}/userrooms/$id";
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
          "_method":"PUT",
          "active":"1",
         "room_id":room_id,
          "user_id":user_id
        });
        print(formData.fields);
        print("ssssssssssssssssss");
        Response response = await dio.post(url, data: formData);
        print('${response.data},,,,,,,,fields');
        connection=response.statusCode!;
        notifyListeners();
        if (response.statusCode == 200) {
          Map<String, dynamic>map = response.data;
          responceInfo=response.data;
          notifyListeners();
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
  Future<void>updateRoom2(var id,BuildContext context,String name_en,String name_ar,var room_id,var user_id)async
  {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      Dio dio = Dio();
      dio.options.headers['Content-Type'] = 'application/json';
      dio.options.headers['Authorization'] = "Bearer "+sharedPreferences.getString("token")!;
      ///we used uri.encode to enable upload  image with arabic name
      // var url =Uri.encodeFull(createPath('user/editProfileImage'));
      var url = "${ServicesConfig.base_url}/userrooms/$id";
      print(url);

      // print('${fileName},,,,fileName');
      //print('${pathImage.path},,,,imagePath.path');

      FormData formData = FormData.fromMap({
        "name_ar":name_ar,
        "name_en":name_en,
        "_method":"PUT",
        "active":"1",
        "room_id":room_id,
        "user_id":user_id
      });
      print(formData.fields);
      print("ssssssssssssssssss");
      Response response = await dio.post(url, data: formData);
      print('${response.data},,,,,,,,fields');
      connection=response.statusCode!;
      notifyListeners();
      if (response.statusCode == 200) {
        Map<String, dynamic>map = response.data;
        responceInfo=response.data;
        notifyListeners();
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
  Future<void> deleteRoom(var id) async{
    String url=ServicesConfig.base_url+"/userrooms/bulkDelete?ids[]=$id";
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
}