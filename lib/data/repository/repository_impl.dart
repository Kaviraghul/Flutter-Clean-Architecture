// this is the repository implementer of repository class in the domain layer

import 'package:flutter_clean_architecture/data/data_source/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/network/error_handler.dart';
import 'package:flutter_clean_architecture/data/network/network_info.dart';
import 'package:flutter_clean_architecture/domain/model.dart';
import 'package:flutter_clean_architecture/data/request/request.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/domain/repository.dart';
import 'package:flutter_clean_architecture/data/mapper/mapper.dart';

class RepositoryImpl extends Repository{

  // ignore: prefer_final_fields
  RemoteDataSource _remoteDataSource;
  // ignore: prefer_final_fields
  NetworkInfo _networkInfo;

  RepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async {
    if(await _networkInfo.isConneected){

      // this will return the future responce of Authentication responce

      try {
      final response = await _remoteDataSource.login(loginRequest);
        
      if(response.status == ApiInternalStatus.SUCCESS){
        return Right(response.toDomain());
      }else{
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE, response.message ?? ResponseMessage.DEFAULT));
      }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }

    }else {
      // return default response
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  
}