import 'package:dartz/dartz.dart';
import 'package:my_portrait/app/core/error/error_app.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';

abstract class ICreatePortraitRepository {
  Future<Either<ErrorGenerico, void>> salvarRetratosLocal(
      RetratosEntity retratosEntity);
  Future<Either<ErrorGenerico, void>> salvarRetratosRemoto(
      RetratosEntity retratosEntity);
}
