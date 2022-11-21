import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/auth_repository.dart';

class IsUserLoggedInUsecase implements UseCase<bool, NoParams> {
  final AuthRepository authRepository;

  IsUserLoggedInUsecase({required this.authRepository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await authRepository.isUserLoggedIn();
  }
}