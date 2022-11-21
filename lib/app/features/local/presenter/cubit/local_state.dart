part of 'local_cubit.dart';

@immutable
abstract class LocalState {}

class LocalInitial extends LocalState {}

class LocalLoading extends LocalState {}

class LocalSucesso extends LocalState {
  final List<RetratosEntity> retratos;
  LocalSucesso({
    required this.retratos,
  });
}

class LocalError extends LocalState {}
