import 'package:dartz/dartz.dart';
import 'package:my_portrait/app/core/error/error_app.dart';
import 'package:my_portrait/app/features/create_portrait/domain/repository/i_create_portrait_repository.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';

class SalvarRetratosLocalUsecase {
  final ICreatePortraitRepository repository;
  SalvarRetratosLocalUsecase({
    required this.repository,
  });
  Future<Either<ErrorGenerico, void>> call(
      RetratosEntity retratosEntity) async {
    return await repository.salvarRetratosLocal(retratosEntity);
  }
}
