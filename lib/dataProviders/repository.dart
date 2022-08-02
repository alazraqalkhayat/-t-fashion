import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'error/exceptions.dart';
import 'error/failures.dart';

typedef Future<dynamic> GetDataFunction();
typedef dynamic GetCacheDataFunction();

class Repository {
  Future<Either<Failure, dynamic>> sendRequest({
    required GetDataFunction remoteFunction,
    GetCacheDataFunction? getCacheDataFunction,
    required Future<bool> checkConnection,
  }) async {
    if (await checkConnection) {
      try {
        final remoteData = await remoteFunction();
        return Right(remoteData);
      } on InvalidException {
        return Left(InvalidFailure());
      } on NotFoundException {
        return Left(NotFoundFailure());
      } on EmptyException {
        return Left(NotFoundFailure());
      } on UniqueException {
        return Left(UniqueFailure());
      } on ExpireException {
        return Left(ExpireFailure());
      } on UserExistsException {
        return Left(UserExistsFailure());
      } on ServerException {
        return Left(ServerFailure());
      } on ReceiveException {
        return Left(ReceiveFailure());
      } on BlockedException {
        return Left(BlockedFailure());
      } on UnauthenticatedException{
        return Left(UnauthenticatedFailure());
      } catch (Exception) {
        print(Exception);
        return Left(ServerFailure());
      }
    } else {
      if (getCacheDataFunction == null) {
        return Left(ConnectionFailure());
      }

      try {
        final localData = getCacheDataFunction();
        return Right(localData);
      } on CacheException {
        return Left(CacheFailure());
      } on EmptyException {
        return Left(NotFoundFailure());
      } catch (Exception) {
        print(Exception);
        return Left(ConnectionFailure());
      }
    }
  }
}
