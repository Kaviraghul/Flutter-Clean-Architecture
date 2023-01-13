import 'dart:async';

import 'package:flutter_clean_architecture/domain/login_usecase.dart';
import 'package:flutter_clean_architecture/presentation/base/base_view_model.dart';
import 'package:flutter_clean_architecture/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInput,LoginViewModelOutput{

//two streem controllers for user name and user password 
  StreamController userNameStreamController = StreamController<String>.broadcast();
  StreamController passwordStreamController = StreamController<String>.broadcast();

  var loginObject = LoginObject(username: "", password: "");

  LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    userNameStreamController.close();
    passwordStreamController.close();
  }

  @override
  void start() {
    // TODO: implement start
  }
   
  @override
  login() async {
    (await _loginUseCase.execute(LoginUseCaseInput(loginObject.username, loginObject.password))).fold((failure) => print(failure.message), (data) => print(data.customer!.name));
    }
  
  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
  }
  
  @override
  setUsername(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(username: username);
  }

  @override
  Sink get inputPassword => passwordStreamController.sink;
  
  @override
  Sink get inputUsername => userNameStreamController.sink;

  @override
  Stream<bool> get outputLoginPassword => passwordStreamController.stream.map((password) => _isPasswordValid(password));
  
  @override
  Stream<bool> get outputLoginUsername => userNameStreamController.stream.map((username) => _isUsernameValid(username));

  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String username){
    return username.isNotEmpty;
  }
}

abstract class LoginViewModelInput{
  setUsername(String username);
  setPassword(String password);
  login();
  Sink get inputUsername;
  Sink get inputPassword;
}

abstract class LoginViewModelOutput{
  Stream<bool> get outputLoginUsername;
  Stream<bool> get outputLoginPassword;
}

