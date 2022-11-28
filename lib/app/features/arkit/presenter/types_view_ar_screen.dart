import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_portrait/app/features/arkit/presenter/arkit_screen.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';

class TypesViewArScreen extends StatefulWidget {
  const TypesViewArScreen({
    required this.retratos,
    super.key,
  });
  final List<RetratosEntity> retratos;

  @override
  State<TypesViewArScreen> createState() => _TypesViewArScreenState();
}

class _TypesViewArScreenState extends State<TypesViewArScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipos de visualização'),
        elevation: 2.0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.cancel),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (Platform.isAndroid) ...[
              Text('Indisponível para Android no momento'),
              SizedBox(
                height: 10,
              )
            ],
            if (Platform.isIOS) ...[
              Text(
                'Visualização em realidade aumentada funciona apenas para retratos salvos no seu dispositivo',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(
                height: 15,
              )
            ],
            _buttonDefault(
              titulo: 'Realidade aumentada',
              color: Colors.blue,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => ArkitScreen(retratos: widget.retratos)));
              },
              isAtivo: Platform.isIOS,
            ),
            SizedBox(
              height: 50,
            ),
            _buttonDefault(
              titulo: 'Visualização normal',
              color: Colors.blue,
              onTap: () {},
              isAtivo: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonDefault({
    required String titulo,
    required Color color,
    required VoidCallback onTap,
    required bool isAtivo,
  }) {
    return InkWell(
      onTap: isAtivo ? onTap : null,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          padding: EdgeInsets.all(20),
          width: 250,
          decoration: BoxDecoration(
              color: isAtivo ? color : Colors.grey,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              titulo,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
