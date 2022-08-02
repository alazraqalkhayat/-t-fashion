import 'package:dartz/dartz.dart';
import 'package:t_fashion/dataProviders/error/failures.dart';
import 'package:t_fashion/dataProviders/local_data_provider.dart';
import 'package:t_fashion/dataProviders/network/Network_info.dart';
import 'package:t_fashion/dataProviders/network/data_source_url.dart';
import 'package:t_fashion/dataProviders/remote_data_provider.dart';
import 'package:t_fashion/dataProviders/repository.dart';
import 'package:t_fashion/features/users/data/model/loginModel.dart';
import 'package:t_fashion/features/users/data/model/signupModel.dart';
import 'package:t_fashion/features/users/data/model/userModel.dart';

class RegisterRepository extends Repository{

  final RemoteDataProvider remoteDataProvider; //get the data from the internet
  final LocalDataProvider localDataProvider; //get the data from the local cache
  final NetworkInfo networkInfo; //check if the device is connected to internet

  RegisterRepository({
    required this.remoteDataProvider,
    required this.localDataProvider,
    required this.networkInfo,
  });


  Future<Either<Failure, dynamic>> signup({required SignupModel signupModel})async {
    return await sendRequest(
      checkConnection: networkInfo.isConnected,
      remoteFunction: () async {
        final remoteData = await remoteDataProvider.sendData(
              url: DataSourceURL.signup,
            retrievedDataType: String,
            body:signupModel.toJson()
        );
        return remoteData;
      },
    );
  }

  Future<Either<Failure, dynamic>> login({required LoginModel loginModel})async {
    return await sendRequest(
      checkConnection: networkInfo.isConnected,
      remoteFunction: () async {
        final remoteData = await remoteDataProvider.sendData(
            url: DataSourceURL.signup,
            retrievedDataType: UserModel.init(),
            body:loginModel.toJson()
        );

        final UserModel user=remoteData;
        localDataProvider.cacheData(key:'USER', data: user.toJson());
        return remoteData;
      },
    );
  }



}