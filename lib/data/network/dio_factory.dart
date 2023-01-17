// ignore_for_file: unused_local_variable, prefer_final_fields, constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/app/app_prefs.dart';
import 'package:flutter_clean_architecture/app/constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory{

  AppPreferences _appPreferences;
  
  DioFactory(this._appPreferences);

  Future<Dio>getDio()async{

    Dio dio =  Dio();
    int _timeOut = 60 * 1000; // 1min
    String langauage = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      CONTENT_TYPE      : APPLICATION_JSON,
      ACCEPT            : APPLICATION_JSON,
      AUTHORIZATION     : Constant.token,
      DEFAULT_LANGUAGE  : langauage
    };

    dio.options = BaseOptions(
      baseUrl: Constant.baseUrl,
      connectTimeout:_timeOut ,
      receiveTimeout:_timeOut,
      headers: headers,
    );


    // this logger must only pring when it is in deug mode not in release mode
    if(kReleaseMode){
      // ignore: avoid_print
      print("release mode on logs");
    }else{
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ));
    }

    return dio;
  }
}