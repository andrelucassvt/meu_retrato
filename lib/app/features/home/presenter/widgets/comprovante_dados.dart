import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class ComprovanteDadosScreen extends StatefulWidget {
  const ComprovanteDadosScreen({required this.retratosEntity, super.key});
  final RetratosEntity retratosEntity;

  @override
  State<ComprovanteDadosScreen> createState() => _ComprovanteDadosScreenState();
}

class _ComprovanteDadosScreenState extends State<ComprovanteDadosScreen> {
  final WidgetsToImageController controllerScreenWidget =
      WidgetsToImageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Exportar QRCODE',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actionsIconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
              onPressed: () async {
                try {
                  Share.shareXFiles([XFile(widget.retratosEntity.qrCode)]);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                        'Não foi possivel exportar seu retrato. Tente novamente'),
                  ));
                }
              },
              icon: const Icon(Icons.ios_share_sharp)),
          IconButton(
              onPressed: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              icon: const Icon(Icons.close)),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: WidgetsToImage(
            controller: controllerScreenWidget,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  child: Image.file(File(widget.retratosEntity.qrCode)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
