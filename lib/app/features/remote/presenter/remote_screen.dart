import 'package:flutter/material.dart';
import 'package:my_portrait/app/core/widgets/app_bar_commom.dart';

class RemoteScrenn extends StatefulWidget {
  const RemoteScrenn({super.key});

  @override
  State<RemoteScrenn> createState() => _RemoteScrennState();
}

class _RemoteScrennState extends State<RemoteScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommom(
        titulo: 'Retratos remotos',
        reloadDados: () {},
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Text('Funcionalidade disponivel em breve'),
            )
          ],
        ),
      ),
    );
  }
}
