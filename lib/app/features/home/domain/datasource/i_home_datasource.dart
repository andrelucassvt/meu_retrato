import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';

abstract class IHomeDataSource {
  Future<List<RetratosEntity>> getRetratos();
  Future<void> removeRetrato(RetratosEntity retratosEntity);
}
