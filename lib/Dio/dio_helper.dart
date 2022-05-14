import 'package:dio/dio.dart';

class DioHelper{

  static Dio ?dio;

  static init(){

    dio = Dio(
      BaseOptions(
          baseUrl:'https://fssmarthome.com',
          receiveDataWhenStatusError: true,
          headers: {
            'Accept':'application/Json',
            'language':'en'
          }
      ) ,
    );

  }

  static Future<Response> getDate({
    required String url,
    Map <String,dynamic> ?query,
    String? token,
  })
  async{

    dio?.options= BaseOptions(
        headers: {
          'Authorization': token
        }
    );
    return await dio!.get(url,queryParameters: query) ;

  }

  static Future<Response> postDate({
    required String url,
    Map <String,dynamic> ?query,
    required Map<String,dynamic> data,
    String? token,
  })
  async{
    dio?.options= BaseOptions(
      headers: {
        'Authorization':token
      }

    );
    return await dio!.post(url,queryParameters: query,data: data) ;

  }



}