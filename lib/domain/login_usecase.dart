// ignore_for_file: prefer_final_fields

import 'package:flutter_clean_architecture/app/functions.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/data/request/request.dart';
import 'package:flutter_clean_architecture/domain/base_usecase.dart';
import 'package:flutter_clean_architecture/domain/model.dart';
import 'package:flutter_clean_architecture/domain/repository.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication>{
  Repository _repository;
  LoginUseCase(this._repository);
  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.login(LoginRequest(input.email, input.password, deviceInfo.identifier, deviceInfo.name));
  }

}


// this class is reponsible for collecting the user info from the presentation layer and pass it to data layer
// acts as a mediator btw presentation and data layer
class LoginUseCaseInput{
  String email;
  String password;
  LoginUseCaseInput(this.email, this.password);
}