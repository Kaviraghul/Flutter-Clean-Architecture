// ignore: import_of_legacy_library_into_null_safe
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_clean_architecture/domain/login_usecase.dart';
import 'package:flutter_clean_architecture/presentation/login/login_view_model.dart';
import 'package:get_it/get_it.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_clean_architecture/app/app_prefs.dart';
import 'package:flutter_clean_architecture/data/data_source/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/network/app_api.dart';
import 'package:flutter_clean_architecture/data/network/dio_factory.dart';
import 'package:flutter_clean_architecture/data/network/network_info.dart';
import 'package:flutter_clean_architecture/data/repository/repository_impl.dart';
import 'package:flutter_clean_architecture/domain/repository.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPref = await SharedPreferences.getInstance();

  // shared pref class
  instance.registerLazySingleton<SharedPreferences>(() => sharedPref);

  // app prefs class
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network class
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementation(DataConnectionChecker()));

  // Dio factory class
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  // App service class
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // Remote data class
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance()));

  // repository class
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
