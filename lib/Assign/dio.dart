import 'package:dio/dio.dart';
class DioHelper{
  static late Dio dio ;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl:'https://fssmarthome.com/api',
        //create invoice : https://api.tap.company/v2/invoices
        //get invoice : https://api.tap.company/v2/invoices/list
        receiveDataWhenStatusError: true,

      ),
    );
  }



  static Future<Response> postData({
    required String url,
    Map<String , dynamic>? query,
    required Map<String , dynamic> data,
  })async
  {
    dio.options.headers= {
      //'Content-Type': 'application/json',
      'Authorization':'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZnNzbWFydGhvbWUuY29tXC9hcGlcL2F1dGhcL2xvZ2luIiwiaWF0IjoxNjUyODg5ODkxLCJleHAiOjE2NTQwOTk0OTEsIm5iZiI6MTY1Mjg4OTg5MSwianRpIjoiUWdkcUxiY3M0N1R1ek54biIsInN1YiI6NTIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.5RIq-sELybYI1oN-3flpn7cefPYPdTE2YYWbosy-3T4',
    };
    return dio.post(url,data: data,queryParameters: query);
  }

// static Future<Response> getData({
//   required String url,
//   Map<String , dynamic>? query,
//   String token ='Bearer sk_test_XKokBfNWv6FIYuTMg5sLPjhJ',
// })async
// {
//   dio.options.headers= {
//     'Content-Type':'application/json',
//     'Authorization':token,
//   };
//   return await dio.get(url,queryParameters: query);
// }
// static Future<Response> putData({
//   required String url,
//   Map<String , dynamic>? query,
//   required Map<String , dynamic> data,
//   String lang='en',
//   String? token,
//
// })async
// {
//   dio.options.headers= {
//     'lang':lang,
//     'Content-Type':'application/json',
//     'Authorization':token,
//   };
//   return dio.put(url,data: data,queryParameters: query);
// }
}


