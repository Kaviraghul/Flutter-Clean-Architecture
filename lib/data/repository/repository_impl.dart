// this is the repository implementer of repository class in the domain layer

import 'package:flutter_clean_architecture/data/data_source/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/network/network_info.dart';
import 'package:flutter_clean_architecture/domain/model.dart';
import 'package:flutter_clean_architecture/data/request/request.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/domain/repository.dart';
import 'package:flutter_clean_architecture/data/mapper/mapper.dart';

class RepositoryImpl extends Repository{

  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async {
    if(await _networkInfo.isConneected){

      // this will return the future responce of Authentication responce
      final response = await _remoteDataSource.login(loginRequest);

      if(response.status == 0){
        return Right(response.toDomain());
      }else{
          return Left(Failure(409, response.message ?? "biz logic error"));
      }
    }else {
      // return default response
      return Left(Failure(501, "please check your internet connections"));
    }
  }
  
}