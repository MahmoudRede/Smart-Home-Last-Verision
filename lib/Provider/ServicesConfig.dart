
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
}