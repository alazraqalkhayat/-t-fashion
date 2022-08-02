import 'package:dartz/dartz.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_fashion/dataProviders/local_data_provider.dart';
import 'package:t_fashion/features/users/data/model/userModel.dart';
import 'package:t_fashion/injection_container.dart';

Either<UserModel,bool> checkLoggedIn() {
  try {
    final user = LocalDataProvider(sharedPreferences: sl<SharedPreferences>()).getCachedData(
      key:'USER',
      retrievedDataType: UserModel.init(),
      returnType: List<UserModel>
    );
    if (user != null) {
      return Left(user);
    }
    return Right(false);
  } catch (e) {
    print("checkLoggedIn catch");
    return Right(false);
  }
}

