import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/category/domain/entities/category_entity.dart';
import 'package:lost_n_found/features/category/domain/repositories/batch_repository.dart';

class UpdateCategoryUsecaseParams extends Equatable {
  final String categoryId;
  final String name;
  final String? description;
  final String? status;

  const UpdateCategoryUsecaseParams({
    required this.categoryId,
    required this.name,
    this.description,
    this.status,
  });

  @override
  List<Object?> get props => [categoryId, name, description, status];
}

class UpdateCategoryUsecase
    implements UsecaseWithParams<bool, UpdateCategoryUsecaseParams> {
  final ICategoryRepository _categoryRepository;

  UpdateCategoryUsecase({required ICategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository;

  @override
  Future<Either<Failure, bool>> call(UpdateCategoryUsecaseParams params) {
    final categoryEntity = CategoryEntity(
      categoryId: params.categoryId,
      name: params.name,
      description: params.description,
      status: params.status,
    );

    return _categoryRepository.updateCategory(categoryEntity);
  }
}
