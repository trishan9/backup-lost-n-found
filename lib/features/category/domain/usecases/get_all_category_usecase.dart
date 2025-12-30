import 'package:dartz/dartz.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/category/domain/entities/category_entity.dart';
import 'package:lost_n_found/features/category/domain/repositories/batch_repository.dart';

class GetAllCategoryUsecase
    implements UsecaseWithoutParams<List<CategoryEntity>> {
  final ICategoryRepository _categoryRepository;

  GetAllCategoryUsecase({required ICategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository;

  @override
  Future<Either<Failure, List<CategoryEntity>>> call() {
    return _categoryRepository.getAllCategories();
  }
}
