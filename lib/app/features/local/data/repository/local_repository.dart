import 'package:dartz/dartz.dart';
import 'package:my_portrait/app/core/error/error_app.dart';
import 'package:my_portrait/app/features/home/domain/datasource/i_home_datasource.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';
import 'package:my_portrait/app/features/home/domain/repository/i_home_repository.dart';

class LocalRepository implements IHomeRepository {
  final IHomeDataSource dataSource;
  LocalRepository({
    required this.dataSource,
  });
  @override
  Future<Either<ErrorGenerico, List<RetratosEntity>>> getRetratos() async {
    try {
      final result = await dataSource.getRetratos();
      return Right(result);
    } on ErrorGenerico catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<ErrorGenerico, void>> removeRetrato(
      RetratosEntity retratosEntity) async {
    try {
      final result = await dataSource.removeRetrato(retratosEntity);
      return Right(result);
    } on ErrorGenerico catch (e) {
      return Left(e);
    }
  }
}
