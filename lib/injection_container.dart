import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_fashion/features/users/data/repository/ForgetPasswordRepository.dart';
import 'package:t_fashion/features/users/data/repository/registerRepository.dart';
import 'package:t_fashion/features/users/presentation/manager/forgetPassword/forgetPasswordBloc.dart';
import 'package:t_fashion/features/users/presentation/manager/register/registerBloc.dart';

import 'dataProviders/local_data_provider.dart';
import 'dataProviders/network/Network_info.dart';
import 'dataProviders/remote_data_provider.dart';


final sl = GetIt.instance; //sl = service locator

Future<void> init() async {
  print('start injection');

//  ! Features
  _initRegisterFeature();
  _initForgetPasswordFeature();

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  //data providers

  // data sources
  sl.registerLazySingleton<RemoteDataProvider>(() => RemoteDataProvider(client: sl()));
  sl.registerLazySingleton<LocalDataProvider>(() => LocalDataProvider(sharedPreferences: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());

}



void _initRegisterFeature() {
//bloc
  sl.registerFactory(() => RegisterBloc(repository: sl()));
  print('register 1');

  //repository
  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepository(
      remoteDataProvider: sl(),
      localDataProvider: sl(),
      networkInfo: sl(),
    ),
  );

}
void _initForgetPasswordFeature() {
  sl.registerFactory(() => ForgetPasswordBloc(repository: sl()));
  print('register 1');

  //repository
  sl.registerLazySingleton<ForgetPasswordRepository>(
        () => ForgetPasswordRepository(
      remoteDataProvider: sl(),
      localDataProvider: sl(),
      networkInfo: sl(),
    ),
  );

}



