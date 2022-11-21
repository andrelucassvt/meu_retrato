import 'package:my_portrait/app/core/database/preference/preference_local_data.dart';
import 'package:my_portrait/app/features/home/domain/datasource/i_home_datasource.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';

class LocalDatasource implements IHomeDataSource {
  @override
  Future<List<RetratosEntity>> getRetratos() async {
    final result = await PreferenceLocalData.getImageFromPreferences();
    return RetratosEntity.fromJsonList(result);
  }

  @override
  Future<void> removeRetrato(RetratosEntity retratosEntity) async {
    return await PreferenceLocalData.deleteImageFromPreferences(retratosEntity);
  }
}
