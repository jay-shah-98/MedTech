import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../core/usecase/usecase.dart';
import '../repositories/medtech_repository.dart';

class CategoryListingUsecase implements UseCase<dynamic, String> {
  final MedTechRepository medTechRepository;

  CategoryListingUsecase({required this.medTechRepository});

  @override
  Future<Either<Failure, dynamic>> call(String categoryId) async {
    return await medTechRepository.getCategoryListing(categoryId: categoryId);
  }
}