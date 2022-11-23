import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portrait/app/features/home/coordinator/home_coordinator.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';

class CardRetratosWidget extends StatefulWidget {
  const CardRetratosWidget(
      {required this.retratosEntity, required this.onTapDelete, super.key});
  final RetratosEntity retratosEntity;
  final VoidCallback onTapDelete;

  @override
  State<CardRetratosWidget> createState() => _CardRetratosWidgetState();
}

class _CardRetratosWidgetState extends State<CardRetratosWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: InkWell(
        onTap: () {
          HomeCoordinator.navegarParaComprovanteQRCode(
            context,
            retratosEntity: widget.retratosEntity,
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.retratosEntity.titulo,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () => _showActionSheet(context),
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancelar'),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              widget.onTapDelete();
              Navigator.pop(context);
            },
            child: const Text('Deletar retrato'),
          ),
        ],
      ),
    );
  }
}
