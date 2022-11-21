import 'package:dartz/dartz.dart';
import 'package:my_portrait/app/core/error/error_app.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';
import 'package:my_portrait/app/features/home/domain/repository/i_home_repository.dart';

class RemoveRetratosUsecase {
  final IHomeRepository repository;
  RemoveRetratosUsecase({
    required this.repository,
  });

  Future<Either<ErrorGenerico, void>> call(
      RetratosEntity retratosEntity) async {
    return await repository.removeRetrato(retratosEntity);
  }
}
