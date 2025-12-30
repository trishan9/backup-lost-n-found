import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/category/domain/entities/category_entity.dart';
import 'package:lost_n_found/features/category/domain/repositories/batch_repository.dart';

class CreateCategoryUsecaseParams extends Equatable {
  final String name;
  final String? description;

  const CreateCategoryUsecaseParams({required this.name, this.description});

  @override
  List<Object?> get props => [name, description];
}

class CreateCategoryUsecase
    implements UsecaseWithParams<void, CreateCategoryUsecaseParams> {
  final ICategoryRepository _categoryRepository;

  CreateCategoryUsecase({required ICategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository;

  @override
  Future<Either<Failure, void>> call(CreateCategoryUsecaseParams params) {
    CategoryEntity categoryEntity = CategoryEntity(
      name: params.name,
      description: params.description,
    ); // object creation

    return _categoryRepository.createCategory(categoryEntity);
  }
}
