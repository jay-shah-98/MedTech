import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../repositories/auth_repository.dart';

import '../../core/usecase/usecase.dart';

class SendOTPUsecase implements UseCase<void, String> {
  final AuthRepository authRepository;

  SendOTPUsecase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(String mobileNumber) async{
    return await authRepository.sendOTP(mobileNumber: mobileNumber);
  }
}
