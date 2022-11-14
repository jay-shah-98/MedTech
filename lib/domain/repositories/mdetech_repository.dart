import 'package:dartz/dartz.dart';
import 'package:medtech/core/error/failure.dart';

import '../entities/home_entity.dart';

abstract class MedTechRepository {
  Future<Either<Failure,HomeEntity>> getHomeData();
}
