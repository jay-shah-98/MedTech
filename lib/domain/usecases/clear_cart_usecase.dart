import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/medtech_repository.dart';

class ClearCartUsecase implements UseCase<dynamic, NoParams> {
  final MedTechRepository medTechRepository;

  ClearCartUsecase({required this.medTechRepository});

  @override
  Future<Either<Failure, void>> call(NoParams noParams) async {
    return await medTechRepository.clearCart();
  }
}