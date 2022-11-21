import 'package:dartz/dartz.dart';
import 'package:my_portrait/app/core/error/error_app.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';
import 'package:my_portrait/app/features/home/domain/repository/i_home_repository.dart';

class GetRetratosUsecase {
  final IHomeRepository repository;
  GetRetratosUsecase({
    required this.repository,
  });

  Future<Either<ErrorGenerico, List<RetratosEntity>>> call() async {
    return await repository.getRetratos();
  }
}
