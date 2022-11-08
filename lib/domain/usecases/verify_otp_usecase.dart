import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class VerifyOTPUsecase implements UseCase<void, String> {
  final AuthRepository authRepository;

  VerifyOTPUsecase({required this.authRepository});

  @override
  Future<Either<Failure, UserEntity>> call(String otp) async {
    return await authRepository.verifyOTP(otp: otp);
  }
}
