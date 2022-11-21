import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portrait/app/features/create_portrait/domain/usecase/salvar_retratos_local_usecase.dart';
import 'package:my_portrait/app/features/create_portrait/domain/usecase/salvar_retratos_remoto_usecase.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';

part 'create_protrait_state.dart';

class CreateProtraitCubit extends Cubit<CreateProtraitState> {
  CreateProtraitCubit({
    required this.salvarRetratosLocalUsecase,
    required this.salvarRetratosRemotoUsecase,
  }) : super(CreateProtraitInitial());

  final SalvarRetratosLocalUsecase salvarRetratosLocalUsecase;
  final SalvarRetratosRemotoUsecase salvarRetratosRemotoUsecase;

  Future<void> salvarRetratoLocal(RetratosEntity retratosEntity) async {
    emit(CreateProtraitLoading());
    final result = await salvarRetratosLocalUsecase(retratosEntity);
    result.fold(
        (_) => emit(CreateProtraitError()),
        (sucesso) =>
            emit(CreateProtraitSucesso(retratosEntity: retratosEntity)));
  }
}
