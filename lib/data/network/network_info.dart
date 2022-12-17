

// abstract class for checking if we are connected with the network like if we lose internet connection 
// ignore_for_file: prefer_final_fields, import_of_legacy_library_into_null_safe

import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConneected;
}

class NetworkInfoImplementation implements NetworkInfo{
  DataConnectionChecker _dataConnectionChecker;
   NetworkInfoImplementation(this._dataConnectionChecker);
   
     @override
     Future<bool> get isConneected => _dataConnectionChecker.hasConnection;

}