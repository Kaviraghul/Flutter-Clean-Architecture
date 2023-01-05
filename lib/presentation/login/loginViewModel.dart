import 'package:flutter_clean_architecture/presentation/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel with LoginViewModelInput,LoginViewModelOutput{
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }
  
  @override
  // TODO: implement inputPassword
  Sink get inputPassword => throw UnimplementedError();
  
  @override
  // TODO: implement inputUsername
  Sink get inputUsername => throw UnimplementedError();
  
  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement outputLoginPassword
  Stream<bool> get outputLoginPassword => throw UnimplementedError();
  
  @override
  // TODO: implement outputLoginUsername
  Stream<bool> get outputLoginUsername => throw UnimplementedError();
  
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

