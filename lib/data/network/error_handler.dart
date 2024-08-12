// data source enum can contain all posible values of a data source status

// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ResponseCode {
  // API status code

  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // failure, api rejected the request
  static const int FORBIDDEN = 403; // failure, api rejected the request
  static const int UNAUTHORISED = 401; // failure, user is not authorised
  static const int NOT_FOUND =
      404; // failure, api url is not correct and not found
  static const int INTERNAL_SERVER_ERROR =
      500; // failure crash happened in server side

  // Local status code  for network layer and interlogics

  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECIEVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseCode.RECIEVE_TIMEOUT, ResponseMessage.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
      default:
        return Failure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseMessage {
  // API status code

  static const String SUCCESS = "success"; // success with data
  static const String NO_CONTENT =
      "success with no content"; // success with no content
  static const String BAD_REQUEST =
      "Bad request, try again later"; // failure, api rejected the request
  static const String FORBIDDEN =
      "forbidden request, try again later"; // failure, api rejected the request
  static const String UNAUTHORISED =
      "user is unauthorised, try again later"; // failure, user is not authorised
  static const String NOT_FOUND =
      "Url is not found, try again later"; // failure, api url is not correct and not found
  static const String INTERNAL_SERVER_ERROR =
      "something went wrong, try again later"; // failure crash happened in server side

  // Local status code  for network layer and interlogics

  static const String DEFAULT = "something went wrong, try again later";
  static const String CONNECT_TIMEOUT = "time out error, try again later";
  static const String CANCEL = "request was cancelled, try again later";
  static const String RECIEVE_TIMEOUT = "time out error, try again later";
  static const String SEND_TIMEOUT = "time out error, try again later";
  static const String CACHE_ERROR = "Cache error, try again later";
  static const String NO_INTERNET_CONNECTION =
      "Please check your internet connection";
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // failure = _handleError(error);
    } else {
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  // Failure _handleError(DioError error){
  //   switch(error.type){

  //     case DioErrorType.connectTimeout:
  //       return DataSource.CONNECT_TIMEOUT.getFailure();
  //     case DioErrorType.sendTimeout:
  //       return DataSource.SEND_TIMEOUT.getFailure();
  //     case DioErrorType.receiveTimeout:
  //       return DataSource.RECIEVE_TIMEOUT.getFailure();
  //     case DioErrorType.response:
  //       switch(error.response?.statusCode){
  //         case ResponseCode.BAD_REQUEST:
  //           return DataSource.BAD_REQUEST.getFailure();
  //         case ResponseCode.FORBIDDEN:
  //           return DataSource.FORBIDDEN.getFailure();
  //         case ResponseCode.UNAUTHORISED:
  //           return DataSource.UNAUTHORISED.getFailure();
  //         case ResponseCode.NOT_FOUND:
  //           return DataSource.NOT_FOUND.getFailure();
  //         case ResponseCode.INTERNAL_SERVER_ERROR:
  //           return DataSource.INTERNAL_SERVER_ERROR.getFailure();
  //         default:
  //           return DataSource.DEFAULT.getFailure();
  //       }
  //     case DioErrorType.cancel:
  //       return DataSource.CANCEL.getFailure();
  //     case DioErrorType.other:
  //       return DataSource.DEFAULT.getFailure();
  //   }
  // }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
