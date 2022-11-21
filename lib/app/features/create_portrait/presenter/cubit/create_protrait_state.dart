part of 'create_protrait_cubit.dart';

@immutable
abstract class CreateProtraitState {}

class CreateProtraitInitial extends CreateProtraitState {}

class CreateProtraitLoading extends CreateProtraitState {}

class CreateProtraitSucesso extends CreateProtraitState {
  final RetratosEntity retratosEntity;
  CreateProtraitSucesso({
    required this.retratosEntity,
  });
}

class CreateProtraitError extends CreateProtraitState {}
