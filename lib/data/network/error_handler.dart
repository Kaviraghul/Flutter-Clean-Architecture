// data source enum can contain all posible values of a data source status

enum DataSource {
  // ignore: constant_identifier_names
  SUCCESS,
  // ignore: constant_identifier_names
  NO_CONTENT,
  // ignore: constant_identifier_names
  BAD_REQUEST,
  // ignore: constant_identifier_names
  FORBIDDEN,
  // ignore: constant_identifier_names
  UNAUTHORISED,
  // ignore: constant_identifier_names
  NOT_FOUND,
  // ignore: constant_identifier_names
  INTERNAL_SERVER_ERROR,
  // ignore: constant_identifier_names
  CONNECT_TIMEOUT,
  // ignore: constant_identifier_names
  CANCEL,
  // ignore: constant_identifier_names
  RECIEVE_TIMEOUT,
  // ignore: constant_identifier_names
  SEND_TIMEOUT,
  // ignore: constant_identifier_names
  CACHE_ERROR,
  // ignore: constant_identifier_names
  NO_INTERNET_CONNECTION
}

class ResponseCode{

  // API status code

  // ignore: constant_identifier_names
  static const int SUCCESS                = 200;  // success with data
  // ignore: constant_identifier_names
  static const int NO_CONTENT             = 201;  // success with no content
  // ignore: constant_identifier_names
  static const int BAD_REQUEST            = 400;  // failure, api rejected the request
  // ignore: constant_identifier_names
  static const int FORBIDDEN              = 403;  // failure, api rejected the request
  // ignore: constant_identifier_names
  static const int UNAUTHORISED           = 401;  // failure, user is not authorised
  // ignore: constant_identifier_names
  static const int NOT_FOUND              = 404;  // failure, api url is not correct and not found
  // ignore: constant_identifier_names
  static const int INTERNAL_SERVER_ERROR  = 500;  // failure crash happened in server side


  // Local status code  for network layer and interlogics

  // ignore: constant_identifier_names
  static const int UNKNOWN                = -1;
  // ignore: constant_identifier_names
  static const int CONNECT_TIMEOUT        = -2;
  // ignore: constant_identifier_names
  static const int CANCEL                 = -3;
  // ignore: constant_identifier_names
  static const int RECIEVE_TIMEOUT        = -4;
  // ignore: constant_identifier_names
  static const int SEND_TIMEOUT           = -5;
  // ignore: constant_identifier_names
  static const int CACHE_ERROR            = -6;
  // ignore: constant_identifier_names
  static const int NO_INTERNET_CONNECTION = -7;

}