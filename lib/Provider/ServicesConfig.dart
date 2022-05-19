
import 'package:shared_preferences/shared_preferences.dart';

class ServicesConfig{
  static String base_url="https://fssmarthome.com/api";
  static Future<Map<String,String>>getHeader()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    var header={ "language":pref.getString("lang")==null?"en":pref.getString("lang")!,};
    print(header);
    print("heeeeeaaaaaaaadeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    return header;
  }
  static Future<Map<String,String>>getHeaderWithToken()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    var header={
      "language":pref.getString("lang")==null?"en":pref.getString("lang")!,
      "Authorization":"Bearer "+pref.getString("token")!
    };
    print(header);
    print("heeeeeaaaaaaaadeeeeeeeeeeeerrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    return header;

  }

  //token///
  static Future<Map<String,String>>getHeaderToken()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    var header={
     // "language":pref.getString("lang")==null?"en":pref.getString("lang")!,
     // "Authorization":"Bearer "+pref.getString("token")!
      "Authorization":"Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZnNzbWFydGhvbWUuY29tXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjUyNzMzMTA3LCJleHAiOjE2NTM5NDI3MDcsIm5iZiI6MTY1MjczMzEwNywianRpIjoiTlN2R0ZhZTc4bzVkaWI0eiIsInN1YiI6NTIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.zsuXR4NJ0girsDwHhmpO7V-zjBpZIwbp8nhl-YZqKv8"
    };
    print(header);
    print("heeeeeaaaaaaaadeeeeeeeeeeeerrrrrrrrrr11111111111111111111112222223334444");
    return header;

  }
}