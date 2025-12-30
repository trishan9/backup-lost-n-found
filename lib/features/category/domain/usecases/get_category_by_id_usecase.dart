import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/category/domain/entities/category_entity.dart';
import 'package:lost_n_found/features/category/domain/repositories/batch_repository.dart';

class GetCategoryByIdUsecaseParams extends Equatable {
  final String categoryId;

  const GetCategoryByIdUsecaseParams({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}

class GetCategoryByIdUsecase
    implements UsecaseWithParams<CategoryEntity, GetCategoryByIdUsecaseParams> {
  final ICategoryRepository _categoryRepository;

  GetCategoryByIdUsecase({required ICategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository;

  @override
  Future<Either<Failure, CategoryEntity>> call(
    GetCategoryByIdUsecaseParams params,
  ) {
    return _categoryRepository.getCategoryById(params.categoryId);
  }
}
