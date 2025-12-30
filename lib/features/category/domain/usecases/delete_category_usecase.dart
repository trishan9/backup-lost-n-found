import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/category/domain/repositories/batch_repository.dart';

class DeleteCategoryUsecaseParams extends Equatable {
  final String categoryId;

  const DeleteCategoryUsecaseParams({required this.categoryId});

  @override
  List<Object?> get props => [categoryId];
}

class DeleteCategoryUsecase
    implements UsecaseWithParams<bool, DeleteCategoryUsecaseParams> {
  final ICategoryRepository _categoryRepository;

  DeleteCategoryUsecase({required ICategoryRepository categoryRepository})
    : _categoryRepository = categoryRepository;

  @override
  Future<Either<Failure, bool>> call(DeleteCategoryUsecaseParams params) {
    return _categoryRepository.deleteCategory(params.categoryId);
  }
}
