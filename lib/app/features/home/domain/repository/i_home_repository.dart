import 'package:dartz/dartz.dart';
import 'package:my_portrait/app/core/error/error_app.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';

abstract class IHomeRepository {
  Future<Either<ErrorGenerico, List<RetratosEntity>>> getRetratos();
  Future<Either<ErrorGenerico, void>> removeRetrato(
      RetratosEntity retratosEntity);
}
