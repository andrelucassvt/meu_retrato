import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';
import 'package:my_portrait/app/features/local/domain/usecase/get_retratos_usecase.dart';
import 'package:my_portrait/app/features/local/domain/usecase/remove_retrato_usecase.dart';

part 'local_state.dart';

class LocalCubit extends Cubit<LocalState> {
  LocalCubit({
    required this.getRetratosUsecase,
    required this.removeRetratosUsecase,
  }) : super(LocalInitial());

  final GetRetratosUsecase getRetratosUsecase;
  final RemoveRetratosUsecase removeRetratosUsecase;

  Future<void> buscarRetratos() async {
    emit(LocalLoading());
    final result = await getRetratosUsecase();
    result.fold((erro) => emit(LocalError()), (data) {
      return emit(LocalSucesso(retratos: data));
    });
  }

  Future<void> removeRetrato(RetratosEntity retratosEntity) async {
    final result = await removeRetratosUsecase(retratosEntity);
    result.fold((erro) => emit(LocalError()), (_) {
      buscarRetratos();
    });
  }
}
