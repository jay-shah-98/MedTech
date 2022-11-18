import 'package:dartz/dartz.dart';

import '../entities/cart_entity.dart';
import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/medtech_repository.dart';

class GetCartUsecase implements UseCase<dynamic, NoParams> {
  final MedTechRepository medTechRepository;

  GetCartUsecase({required this.medTechRepository});

  @override
  Future<Either<Failure, CartEntity>> call(NoParams noParams) async {
    return await medTechRepository.getCart();
  }
}
