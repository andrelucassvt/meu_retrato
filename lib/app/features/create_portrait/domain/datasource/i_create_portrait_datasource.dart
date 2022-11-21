import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';

abstract class ICreatePortraitDatasource {
  Future<void> salvarRetratosLocal(RetratosEntity retratosEntity);
  Future<void> salvarRetratosRemoto(RetratosEntity retratosEntity);
}
