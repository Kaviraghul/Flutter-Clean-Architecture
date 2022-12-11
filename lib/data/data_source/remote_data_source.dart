import 'package:flutter_clean_architecture/data/network/app_api.dart';
import 'package:flutter_clean_architecture/data/request/request.dart';
import 'package:flutter_clean_architecture/data/responses/responses.dart';

// abstract class for all abstract events
abstract class RemoteDataSource{
  // abstract implementation for login in 
  Future<AuthenticationResponse>login(LoginRequest loginRequest);
}



// implementer of the abstract class
class RemoteDataSourceImplementer implements RemoteDataSource{
  final AppServiceClient _appServiceClient; // for network calls
  RemoteDataSourceImplementer(this._appServiceClient); // constructor
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
      loginRequest.email,
      loginRequest.password,
      loginRequest.imei,
      loginRequest.deviceType
    );
  }
  
}