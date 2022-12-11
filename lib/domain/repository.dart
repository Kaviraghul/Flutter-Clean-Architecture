import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/data/request/request.dart';
import 'package:flutter_clean_architecture/domain/model.dart';

abstract class Repository{
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  
}