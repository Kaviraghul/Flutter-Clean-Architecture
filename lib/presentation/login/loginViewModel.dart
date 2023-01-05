import 'dart:async';

import 'package:flutter_clean_architecture/presentation/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInput,LoginViewModelOutput{

//two streem controllers for user name and user password 
  StreamController UserNameStreamController = StreamController<String>.broadcast();
  StreamController PasswordStreamController = StreamController<String>.broadcast();


  @override
  void dispose() {
    UserNameStreamController.close();
    PasswordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }
   
  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }
  
  @override
  setPassword() {
    // TODO: implement setPassword
    throw UnimplementedError();
  }
  
  @override
  setUsername() {
    // TODO: implement setUsername
    throw UnimplementedError();
  }

  @override
  Sink get inputPassword => PasswordStreamController.sink;
  
  @override
  Sink get inputUsername => UserNameStreamController.sink;

  @override
  Stream<bool> get outputLoginPassword => PasswordStreamController.stream.map((password) => _isPasswordValid(password));
  
  @override
  Stream<bool> get outputLoginUsername => UserNameStreamController.stream.map((username) => _isUsernameValid(username));

  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String username){
    return username.isNotEmpty;
  }
}

abstract class LoginViewModelInput{
  setUsername();
  setPassword();
  login();
  Sink get inputUsername;
  Sink get inputPassword;
}

abstract class LoginViewModelOutput{
  Stream<bool> get outputLoginUsername;
  Stream<bool> get outputLoginPassword;
}

