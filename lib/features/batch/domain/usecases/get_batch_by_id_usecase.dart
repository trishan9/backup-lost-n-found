import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/batch/domain/entities/batch_entity.dart';
import 'package:lost_n_found/features/batch/domain/repositories/batch_repository.dart';

class GetBatchByIdUsecaseParams extends Equatable {
  final String batchId;

  const GetBatchByIdUsecaseParams({required this.batchId});

  @override
  List<Object?> get props => [batchId];
}

class GetBatchByIdUsecase
    implements UsecaseWithParams<BatchEntity, GetBatchByIdUsecaseParams> {
  final IBatchRepository _batchRepository;

  GetBatchByIdUsecase({required IBatchRepository batchRepository})
    : _batchRepository = batchRepository;

  @override
  Future<Either<Failure, BatchEntity>> call(GetBatchByIdUsecaseParams params) {
    return _batchRepository.getBatchById(params.batchId);
  }
}
