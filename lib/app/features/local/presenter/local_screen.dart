import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_portrait/app/core/routes/routes_app.dart';
import 'package:my_portrait/app/core/widgets/app_bar_commom.dart';
import 'package:my_portrait/app/features/arkit/presenter/arcore_screen.dart';
import 'package:my_portrait/app/features/arkit/presenter/arkit_screen.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';
import 'package:my_portrait/app/features/home/presenter/widgets/card_retratos_widget.dart';
import 'package:my_portrait/app/features/local/presenter/cubit/local_cubit.dart';

class LocalScreen extends StatefulWidget {
  const LocalScreen({super.key});

  @override
  State<LocalScreen> createState() => _LocalScreenState();
}

class _LocalScreenState extends State<LocalScreen> {
  final _cubit = GetIt.I.get<LocalCubit>();
  bool showFloatingButton = false;
  List<RetratosEntity>? retratos;

  @override
  void initState() {
    super.initState();
    _cubit.buscarRetratos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: showFloatingButton
          ? FloatingActionButton.extended(
              onPressed: () {
                if (Platform.isIOS) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ArkitScreen(
                            retratos: retratos!,
                          )));
                } else {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ArcoreScreen()));
                }
              },
              label: const Text('Visualizar'),
              icon: const Icon(Icons.camera),
            )
          : null,
      appBar: AppBarCommom(
        titulo: 'Retratos locais',
        reloadDados: () {
          _cubit.buscarRetratos();
        },
      ),
      body: SafeArea(
        child: BlocConsumer<LocalCubit, LocalState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state is LocalSucesso) {
              setState(() {
                showFloatingButton = true;
              });
            }
          },
          builder: (context, state) {
            if (state is LocalLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LocalError) {
              return const Center(
                child: Text('Ocorreu um erro ao carregar dados'),
              );
            }
            if (state is LocalSucesso) {
              retratos = state.retratos;
              if (retratos!.isEmpty) {
                return Center(
                  child: TextButton(
                    child: const Text(
                      'Você não tem retratos\nClique aqui e adicione um agora',
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesApp.createPortrait)
                          .then((value) {
                        _cubit.buscarRetratos();
                      });
                    },
                  ),
                );
              }
              return ListView.builder(
                itemCount: retratos!.length,
                itemBuilder: (ctx, index) {
                  return CardRetratosWidget(
                    retratosEntity: retratos![index],
                    onTapDelete: () {
                      _cubit.removeRetrato(retratos![index]);
                    },
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
