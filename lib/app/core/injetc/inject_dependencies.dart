import 'package:get_it/get_it.dart';
import 'package:my_portrait/app/features/create_portrait/data/datasource/create_portrait_datasource.dart';
import 'package:my_portrait/app/features/create_portrait/data/repository/create_portrait_repository.dart';
import 'package:my_portrait/app/features/create_portrait/domain/datasource/i_create_portrait_datasource.dart';
import 'package:my_portrait/app/features/create_portrait/domain/repository/i_create_portrait_repository.dart';
import 'package:my_portrait/app/features/create_portrait/domain/usecase/salvar_retratos_local_usecase.dart';
import 'package:my_portrait/app/features/create_portrait/domain/usecase/salvar_retratos_remoto_usecase.dart';
import 'package:my_portrait/app/features/create_portrait/presenter/cubit/create_protrait_cubit.dart';
import 'package:my_portrait/app/features/local/data/datasource/local_datasource.dart';
import 'package:my_portrait/app/features/local/data/repository/local_repository.dart';
import 'package:my_portrait/app/features/local/domain/usecase/get_retratos_usecase.dart';
import 'package:my_portrait/app/features/local/domain/usecase/remove_retrato_usecase.dart';
import 'package:my_portrait/app/features/local/presenter/cubit/local_cubit.dart';

class InjectDependencies {
  static void main() {
    final getIt = GetIt.instance;

    // create portrait

    getIt.registerFactory<ICreatePortraitDatasource>(
        () => CreatePortraitDatasource());

    getIt.registerFactory<ICreatePortraitRepository>(
        () => CreatePortraitRepository(datasource: getIt()));

    getIt.registerFactory<SalvarRetratosLocalUsecase>(
        () => SalvarRetratosLocalUsecase(repository: getIt()));

    getIt.registerFactory<SalvarRetratosRemotoUsecase>(
        () => SalvarRetratosRemotoUsecase(repository: getIt()));

    getIt.registerFactory<CreateProtraitCubit>(() => CreateProtraitCubit(
        salvarRetratosLocalUsecase: getIt(),
        salvarRetratosRemotoUsecase: getIt()));

    // Local dependencias
    getIt.registerFactory<LocalDatasource>(() => LocalDatasource());

    getIt.registerFactory<LocalRepository>(
        () => LocalRepository(dataSource: getIt<LocalDatasource>()));

    getIt.registerFactory<GetRetratosUsecase>(
        () => GetRetratosUsecase(repository: getIt<LocalRepository>()));

    getIt.registerFactory<RemoveRetratosUsecase>(
        () => RemoveRetratosUsecase(repository: getIt<LocalRepository>()));

    getIt.registerFactory(() => LocalCubit(
        getRetratosUsecase: getIt(), removeRetratosUsecase: getIt()));
  }
}
