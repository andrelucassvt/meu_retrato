import 'package:my_portrait/app/core/database/preference/preference_local_data.dart';
import 'package:my_portrait/app/features/create_portrait/domain/datasource/i_create_portrait_datasource.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';

class CreatePortraitDatasource implements ICreatePortraitDatasource {
  @override
  Future<void> salvarRetratosLocal(RetratosEntity retratosEntity) async {
    PreferenceLocalData.saveImageToPreferences(retratosEntity);
  }

  @override
  Future<void> salvarRetratosRemoto(RetratosEntity retratosEntity) async {}
}
