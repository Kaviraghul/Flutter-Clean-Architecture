
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/app/constant.dart';
import 'package:flutter_clean_architecture/data/responses/responses.dart';
import 'package:retrofit/http.dart';

 part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient{

  factory AppServiceClient(Dio Dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
    @Field("imei") String imei,
    @Field("deviceType") String deviceType,
  );
}