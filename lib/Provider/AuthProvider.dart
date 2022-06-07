import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:fssmarthome/Models/UserModel.dart';
import 'package:fssmarthome/Provider/ServicesConfig.dart';
import 'package:fssmarthome/Views/Login.dart';
import 'package:fssmarthome/Views/user_screen.dart';
import 'package:fssmarthome/main.dart';
import 'package:http_parser/http_parser.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:path/path.dart';
import 'package:http/http.dart'as http;
import 'package:email_auth/email_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Base/Cash_Helper/cash_helper.dart';
import '../Constants/constants.dart';
import '../Dio/dio_helper.dart';
import '../Views/Custom/GlobalFunction.dart';
import '../Views/User_Screens/user_screen_container.dart';
class AuthProvider extends ChangeNotifier{
  bool loadingImage=false;
  late int statusCodeConnection;
  late Map<String,dynamic>LoginInfo;
  late Map<String,dynamic>RegisterInfo;
  late Map<String,dynamic>updateInfo;
   Map<String,dynamic>updateInfoTechnical={};
  List<UsersModel>users=[];
  Map<String,dynamic> user={};
  Map<String,dynamic>userInfo={};
  Map<String,dynamic>forgetPassword={};
  var aboutEn;
  var aboutAr;
  var aboutPhone;
  var aboutWebSite;
  TextEditingController name =new TextEditingController();
  TextEditingController email =new TextEditingController();
  TextEditingController phone =new TextEditingController();
/////////////////////////////////////////////////////////////
  late Map<String,dynamic>assignRooms;
  int userRoom = 194;
  int userAssignId = 52;
  int userRoomDevice_id = 265;
  Future<void> assidnedUserRooms() async{
    String url=ServicesConfig.base_url+"/api/assigned";
    print(url);
    var body={
      "userRoom_id":'$userRoom',
      "user_id":'$userAssignId',
      "userRoomDevice_id" : '$userRoomDevice_id',
    };

    print(body);
    Map<String , String> header={
    'Connection':'keep-alive',
    'Accept-Encoding':'gzip, deflate, br',
      //'Content-Type': 'application/json',
      'Authorization':"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZnNzbWFydGhvbWUuY29tXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjUyODg5ODkxLCJleHAiOjE2NTQwOTk0OTEsIm5iZiI6MTY1Mjg4OTg5MSwianRpIjoiUWdkcUxiY3M0N1R1ek54biIsInN1YiI6NTIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.5RIq-sELybYI1oN-3flpn7cefPYPdTE2YYWbosy-3T4",
    };
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers:header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;
        assignRooms=json.decode(responce.body);
        print(assignRooms);
        notifyListeners();
      }
      print(statusCodeConnection);
    }
    catch(e) {
      print(e.toString());
    }
  }
  var isUser;
  //////////////////////////////////////////////
  Future<void> LoginServices(String email,String password,context) async{
    String url=ServicesConfig.base_url+"/auth/login";
    print(url);
    var body={
      "username" : email,
      "password" : password,
      "remember_me":"0",
      "fcm_token":"444444444444ssssssssssssssssssssssssssssssssssssssss444"
    };
    print(body);
    var header=await ServicesConfig.getHeader();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;
        LoginInfo=json.decode(responce.body);
        print(LoginInfo);
        print('/////////////////////////////////////');
        print(LoginInfo['data']['parent_id']);
          isUser=LoginInfo['data']['parent_id'];
          CashHelper.saveData(key: 'isUser',value: isUser);
        if(isUser!=null){
           Navigator.push(context, MaterialPageRoute(builder: (_){
             return UserScreen();
           }));
         // Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);


        }else{
          Navigator.pushNamedAndRemoveUntil(context,"/mainPage", (route) => false);

        }

        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }

  void userLogin({
    String? email,
    String? password,
  }){

    DioHelper.postDate(
        url: loginUrl!,
        data: {
          'username':email,
          'password':password
        }
    ).then((value) {
      print(value.data);
      notifyListeners();

    }).catchError((error){
      print('Error is ${error.toString()}');
      notifyListeners();

    });

  }


  Future<void> LoginSocial(String socialId,var name,String email) async{
    String url=ServicesConfig.base_url+"/auth/social_login";
    print(url);
    var body={
      "socialId" : socialId,
      "name" : name,
      "email":email,
      "phone":""
     };
    print(body);
    var header=await ServicesConfig.getHeader();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      print("---------------------------------------------------------------------");
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;
        LoginInfo=json.decode(responce.body);
        print(LoginInfo);
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> forgetpassword(String email) async{
    String url=ServicesConfig.base_url+"/auth/forgot";
    print(url);
    var body={
      "email" : email,
    };
    print(body);
    var header=await ServicesConfig.getHeader();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;
        forgetPassword=json.decode(responce.body);
        print(forgetPassword);
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  var messageCheck='';
  Future<void> checkCode(String email,String code) async{
    String url=ServicesConfig.base_url+"/auth/checkcode";
    print(url);
    var body={
      "email" : email,
      "code":code
    };
    print(body);
    var header=await ServicesConfig.getHeader();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      messageCheck=json.decode(responce.body)['message'];
      CashHelper.saveData(key: 'messageCheck',value: messageCheck);
      notifyListeners();
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;
        forgetPassword=json.decode(responce.body);

        print(forgetPassword);
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> resetPassword(String code,String password,String confirmPassword) async{
    String url=ServicesConfig.base_url+"/auth/reset";
    print(url);
    var body={
      "reset_code" : code,
      "password":password,
      "password_confirmation":confirmPassword
    };
    print(body);
    var header=await ServicesConfig.getHeader();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;
        forgetPassword=json.decode(responce.body);
        print(forgetPassword);
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> RegisterServices(String name,String phone,String email,String password,String password_confirmation) async{
    String url=ServicesConfig.base_url+"/auth/register";
    print(url);
    var body={
      "name":name,
      "phone":phone,
      "email" : email,
      "password" : password,
      "password_confirmation":password_confirmation,
    };
    print(body);
    var header=await ServicesConfig.getHeader();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;
        RegisterInfo=json.decode(responce.body);
        print(RegisterInfo);
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }

  Future<void> getUserInfo() async{
    String url=ServicesConfig.base_url+"/user";
    print(url);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.get(Uri.parse(url),headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;
        userInfo=json.decode(responce.body)["data"];
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> editProfile(String name,String email,String phone,int id) async{
    String url=ServicesConfig.base_url+"/profile/$id";
    print(url);
    var body={
      "name":name,
      "email" : email,
      "phone" : phone,
    };
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.put(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;
        updateInfo=json.decode(responce.body);
        print(updateInfo);
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  Future<void> editProfileTechnical(var country_id,var city_id,var region_id,var job_id,var experince_years,String job) async{
    String url=ServicesConfig.base_url+"/profile/1";
    print(url);
    var body={
      "country_id":country_id.toString(),
      "city_id" : city_id.toString(),
      "region_id" : region_id.toString(),
      "category_id":job_id.toString(),
      "job":job,
      "experince_years":experince_years.toString()
    };
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.put(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        updateInfoTechnical=json.decode(responce.body);
        print(updateInfoTechnical);
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  sendImagePick(File fileImage,BuildContext context)async
  {
    if (fileImage != null) {
      try {
        SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        Dio dio = Dio();
         dio.options.headers['Content-Type'] = 'application/json';
        dio.options.headers['Authorization'] = "Bearer "+sharedPreferences.getString("token")!;
        ///we used uri.encode to enable upload  image with arabic name
        // var url =Uri.encodeFull(createPath('user/editProfileImage'));
        var url = "${ServicesConfig.base_url}/profileImage/1";
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
        });
        print(formData.fields);
        print("ssssssssssssssssss");
        Response response = await dio.post(url, data: formData);
        print('${response.data},,,,,,,,fields');
        if (response.statusCode == 200) {
          Map<String, dynamic>map = response.data;
          FlutterToastr.show("Image Has Been Updated", context, duration: FlutterToastr.lengthShort, position:  FlutterToastr.center);
          this.getUserInfo();
          loadingImage=false;
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
  Future<void> AddUser(String name,String phone,String email,String password,String password_confirmation) async{
    String url=ServicesConfig.base_url+"/add_user";
    print(url);
    var body={
      "name":name,
      "phone":phone,
      "email" : email,
      "password" : password,
      "password_confirmation":password_confirmation,
    };
    print(body);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.post(Uri.parse(url),body:body,headers: header);
      print(responce.body);
      print("-----------------------------------------------------------------");
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;
        RegisterInfo=json.decode(responce.body);
        print(RegisterInfo);
        getUsers();
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }
  List<int> userId=[];
  Future<void>getUsers()async{
    var body=GlobalFunction.getBody(300, 0, "id", "ASC", "all", "false", "true", ["parent_id"], ["="], [MyApp.user_id]);
    var url=ServicesConfig.base_url+"/users/$body";
    var header=await ServicesConfig.getHeaderWithToken();
    try
    {
      final response = await http.get(Uri.parse(url),headers: header);
      if(response.statusCode==200 && response.body!=null)
      {
        print("enter ");
        print(json.decode(utf8.decode(response.bodyBytes))["data"]);

        List slideritems = json.decode(utf8.decode(response.bodyBytes))["data"]["data"];
        users = slideritems.map((e) {
        return  UsersModel.fromJson(e);
        }).toList();
        users.forEach((element) {
          userId.add(element.id);
        });
        print(users.length);

        print("devicesdevicesdevicesdevicesdevicesdevicesdevices");
        notifyListeners();
      }
    }
    catch(e)
    {
      print(e);
    }
  }

  Future<void>removeUsers(var id)async{

    var url=ServicesConfig.base_url+"/users/bulkDelete?ids[]=$id";
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.delete(Uri.parse(url),headers: header);
      if(responce.body.isNotEmpty)
      {
        getUsers();
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }

  Future<void> getUser(var id) async{
    String url=ServicesConfig.base_url+"/users/$id";
    print(url);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.get(Uri.parse(url),headers: header);
      print(responce.body);
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;
        user=json.decode(responce.body)["data"];
        // print('////////////// user ////////');
        // print(user);
        // print('////////////// data ////////');
        // print(user['data']);
        // print('////////////// email ////////');
        // print(user['email']);
        // print('////////////// data email ////////');

        print(user['data']['email']);

        print(email.text);
        print('اعااااااااااااااااااااااااااا');


        email.text=user['data']['email'];
        phone.text=user['data']['phone'];
        name.text=user['data']['name'];
        // email.text=user['data']['email'];
        // phone.text=user['data']['phone'];
        // name.text=user['data']['name'];
        // print(responce.body[0][0][0]);
        // email.text=user['email'];

        // print('//////////////////');
        // print(name.text);
        notifyListeners();
      }
    }
    catch(e) {
      print(e.toString());
    }
  }

  EmailAuth emailAuth =  EmailAuth(sessionName: "Complete Register");

  void sendOtp(String email) async{
     EmailAuth(
      sessionName: "Sample session",
    );
     bool result = await emailAuth.sendOtp(
         recipientMail: email, otpLength: 5
     );
     if(result){
       print('OTP Send Success');
     }
     else{
       print('Error in send OTP');

     }
  }

  void verifyOtp(String otp,context){
     
    var res=emailAuth.validateOtp(
        recipientMail: 'mahmoudreda123456789101112@gmail.com',
        userOtp: otp
    );
    if(res){
      Navigator.push(context, MaterialPageRoute(builder: (_){
        return Login();
      }));
      print('Validate True');
    }
    else{
      FlutterToastr.show(translator.translate('Invalid Code'), context, duration: FlutterToastr.lengthLong, position:  FlutterToastr.center,backgroundColor: Colors.red);

      print('Validate False');
    }

  }
  
  void googleSignIn()async{
    GoogleSignIn googleSignIn = GoogleSignIn();
      try {
       var res = await googleSignIn.signIn();
       print(res);


      } catch (error) {

        print(error);
      }


  }
  Future<void> getAbout() async{
    String url=ServicesConfig.base_url+"/infos";
    print(url);
    var header=await ServicesConfig.getHeaderWithToken();
    try{
      final responce=await http.get(Uri.parse(url),headers: header);
      print('siiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
      aboutEn=json.decode(responce.body)["data"]["data"][0]["bio_en"];
      aboutAr=json.decode(responce.body)["data"]["data"][0]["bio_ar"];
      aboutPhone=json.decode(responce.body)["data"]["data"][0]["phone"];
      aboutWebSite=json.decode(responce.body)["data"]["data"][0]["website_link"];

      print(aboutEn);
      print(responce.body);
      notifyListeners();

      print('siiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
      if(responce.body.isNotEmpty)
      {
        statusCodeConnection=responce.statusCode;


      }
    }
    catch(e) {
      print(e.toString());
    }
  }
}
