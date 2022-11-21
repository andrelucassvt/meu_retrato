import 'dart:async';
import 'dart:io';

import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ArkitScreen extends StatefulWidget {
  const ArkitScreen({required this.retratos, super.key});
  final List<RetratosEntity> retratos;

  @override
  State<ArkitScreen> createState() => _ArkitScreenState();
}

class _ArkitScreenState extends State<ArkitScreen> {
  late ARKitController arkitController;
  Timer? timer;
  bool anchorWasFound = false;
  File? file;

  @override
  void dispose() {
    timer?.cancel();
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AR Retratos')),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ARKitSceneView(
            detectionImages: widget.retratos
                .map((retrato) => ARKitReferenceImage(
                      name: retrato.qrCode,
                      physicalWidth: 0.2,
                    ))
                .toList(),
            onARKitViewCreated: onARKitViewCreated,
          ),
          anchorWasFound
              ? Container()
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Posicione a câmera no QRCODE para mostrar seu retrato',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = onAnchorWasFound;
  }

  void onAnchorWasFound(ARKitAnchor anchor) async {
    if (anchor is ARKitImageAnchor) {
      setState(() => anchorWasFound = true);

      final result = widget.retratos
          .where((element) => element.qrCode == anchor.referenceImageName)
          .first;
      await Future.delayed(const Duration(seconds: 1));
      final material = ARKitMaterial(
        diffuse: ARKitMaterialProperty.image(result.imagem),
      );
      final sphere = ARKitPlane(materials: [material], height: 0.3, width: 0.3);

      final earthPosition = anchor.transform.getColumn(3);
      final node = ARKitNode(
        geometry: sphere,
        position:
            vector.Vector3(earthPosition.x, earthPosition.y, earthPosition.z),
        eulerAngles: vector.Vector3.zero(),
      );
      arkitController.add(node);
    }
  }
}
