// ignore_for_file: avoid_print, prefer_final_fields

import 'dart:async';

import 'package:flutter_clean_architecture/domain/login_usecase.dart';
import 'package:flutter_clean_architecture/presentation/base/base_view_model.dart';
import 'package:flutter_clean_architecture/presentation/common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInput, LoginViewModelOutput {
//two streem controllers for user name and user password
  StreamController userNameStreamController =
      StreamController<String>.broadcast();
  StreamController passwordStreamController =
      StreamController<String>.broadcast();
  StreamController isAllInputsValidStreamController =
      StreamController<void>.broadcast();

  var loginObject = LoginObject(username: "", password: "");

  LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    userNameStreamController.close();
    passwordStreamController.close();
    isAllInputsValidStreamController.close();
  }

  @override
  void start() {
  }

  @override
  login() async {
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.username, loginObject.password)))
        .fold((failure) => print(failure.message),
            (data) => print(data.customer!.name));
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    _validate();
  }

  @override
  setUsername(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(username: username);
    _validate();
  }

  @override
  Sink get inputPassword    => passwordStreamController.sink;

  @override
  Sink get inputUsername    => userNameStreamController.sink;

  @override
  Sink get isAllInputValid  => isAllInputsValidStreamController.sink;

  @override
  Stream<bool> get outputLoginPassword => passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputLoginUsername => userNameStreamController.stream
      .map((username) => _isUsernameValid(username));

  @override
  Stream<bool> get outputIsAllInputValid => isAllInputsValidStreamController.stream.map((_) => 
  _isAllInputValid());

  _validate(){
     isAllInputValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String username) {
    return username.isNotEmpty;
  }

  bool _isAllInputValid(){
    return _isUsernameValid(loginObject.username) && _isPasswordValid(loginObject.password);
  }
}

abstract class LoginViewModelInput {
  setUsername(String username);
  setPassword(String password);
  login();
  Sink get inputUsername;
  Sink get inputPassword;
  Sink get isAllInputValid;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outputLoginUsername;
  Stream<bool> get outputLoginPassword;
  Stream<bool> get outputIsAllInputValid;
}
