import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../core/error/exception.dart';
import '../../core/network/network_info.dart';
import '../datasources/remote_auth_data_source.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

import '../../core/error/failure.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource remoteAuthDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteAuthDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> sendOTP({required String mobileNumber}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(
            await remoteAuthDataSource.sendOTP(mobileNumber: mobileNumber));
      } on AuthException catch (e) {
        return Left(ServerFailure(message: e.message));
      } catch (e) {
        return const Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> verifyOTP({required String otp}) async {
    if (await networkInfo.isConnected) {
      try {
        final User user = await remoteAuthDataSource.verifyOTP(otp: otp);
        UserEntity userEntity = UserEntity(
          name: user.displayName ?? '',
          email: user.email ?? '',
          phoneNumber: user.phoneNumber ?? '',
        );
        return Right(userEntity);
      } on AuthException catch (e) {
        return Left(ServerFailure(message: e.message));
      } on ServerException {
        return const Left(ServerFailure());
      } catch (e) {
        return const Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> login({required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final User user = await remoteAuthDataSource.signIn(email, password);
        UserEntity userEntity = UserEntity(
          name: user.displayName ?? '',
          email: user.email ?? '',
          phoneNumber: user.phoneNumber ?? '',
        );
        return Right(userEntity);
      } on AuthException catch (e) {
        return Left(ServerFailure(message: e.message));
      } on ServerException {
        return const Left(ServerFailure());
      } catch (e) {
        return const Left(ServerFailure());
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
