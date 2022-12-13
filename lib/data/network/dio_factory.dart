// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/app/constant.dart';


// ignore: constant_identifier_names
const String APPLICATION_JSON = "application/json";
// ignore: constant_identifier_names
const String CONTENT_TYPE = "content-type";
// ignore: constant_identifier_names
const String ACCEPT = "accept";
// ignore: constant_identifier_names
const String AUTHORIZATION = "authorization";
// ignore: constant_identifier_names
const String DEFAULT_LANGUAGE = "language";
// ignore: constant_identifier_names

class DioFactory{
  Future<Dio>getDio()async{
    Dio dio = Dio();
    // ignore: no_leading_underscores_for_local_identifiers
    int _timeOut = 60 *1000; // 1min
    
    Map<String, String> headers = {
      CONTENT_TYPE      : APPLICATION_JSON,
      ACCEPT            : APPLICATION_JSON,
      AUTHORIZATION     : Constant.token,
      DEFAULT_LANGUAGE  : "en"
    };

    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout:_timeOut ,
      receiveTimeout:_timeOut,
      headers: headers,
    );

    return dio;
  }
}