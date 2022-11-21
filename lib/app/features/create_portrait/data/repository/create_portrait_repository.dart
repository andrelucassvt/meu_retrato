import 'package:dartz/dartz.dart';
import 'package:my_portrait/app/core/error/error_app.dart';
import 'package:my_portrait/app/features/create_portrait/domain/datasource/i_create_portrait_datasource.dart';
import 'package:my_portrait/app/features/create_portrait/domain/repository/i_create_portrait_repository.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';

class CreatePortraitRepository implements ICreatePortraitRepository {
  final ICreatePortraitDatasource datasource;
  CreatePortraitRepository({
    required this.datasource,
  });
  @override
  Future<Either<ErrorGenerico, void>> salvarRetratosLocal(
      RetratosEntity retratosEntity) async {
    try {
      return Right(datasource.salvarRetratosLocal(retratosEntity));
    } on ErrorGenerico catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ErrorGenerico, void>> salvarRetratosRemoto(
      RetratosEntity retratosEntity) async {
    try {
      return Right(datasource.salvarRetratosRemoto(retratosEntity));
    } on ErrorGenerico catch (e) {
      return Left(e);
    }
  }
}
