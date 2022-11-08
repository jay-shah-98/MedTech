import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, void>> sendOTP({
    required String mobileNumber,
  });

  Future<Either<Failure, UserEntity>> verifyOTP({
    required String otp,
  });

  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });
}
