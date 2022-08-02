import 'package:t_fashion/dataProviders/local_data_provider.dart';
import 'package:t_fashion/dataProviders/network/Network_info.dart';
import 'package:t_fashion/dataProviders/remote_data_provider.dart';
import 'package:t_fashion/dataProviders/repository.dart';

class ForgetPasswordRepository extends Repository{

  final RemoteDataProvider remoteDataProvider; //get the data from the internet
  final LocalDataProvider localDataProvider; //get the data from the local cache
  final NetworkInfo networkInfo; //check if the device is connected to internet

  ForgetPasswordRepository({
    required this.remoteDataProvider,
    required this.localDataProvider,
    required this.networkInfo,
  });

}