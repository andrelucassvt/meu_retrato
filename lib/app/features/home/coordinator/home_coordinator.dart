import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';
import 'package:my_portrait/app/features/home/presenter/widgets/comprovante_dados.dart';
import 'package:my_portrait/app/features/tutorial/presenter/tutorial_screen.dart';

class HomeCoordinator {
  static void navegarParaTutorial(BuildContext context,
      {bool isDismissible = true}) {
    showModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      builder: (context) => TutotialScreen(),
    );
  }

  static void navegarParaComprovanteQRCode(
    BuildContext context, {
    required RetratosEntity retratosEntity,
    bool isDismissible = true,
  }) {
    showModalBottomSheet(
        context: context,
        isDismissible: isDismissible,
        builder: (ctx) =>
            ComprovanteDadosScreen(retratosEntity: retratosEntity));
  }

  static void navegarParaMensagemDeErroSemPermissao(
    BuildContext context, {
    required String tipoPermissao,
  }) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text(
          'Atenção',
          style: TextStyle(color: Colors.red),
        ),
        content: Text(
            'Você não tem permissão para acessar $tipoPermissao.\nPermita o acesso nas configurações'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ir para configurações'),
          ),
        ],
      ),
    );
  }
}
