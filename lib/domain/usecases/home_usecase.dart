import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/medtech_repository.dart';

class HomeUsecase implements UseCase<dynamic, NoParams> {
  final MedTechRepository medTechRepository;

  HomeUsecase({required this.medTechRepository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams noParams) async {
    return await medTechRepository.getHomeData();
  }
}
