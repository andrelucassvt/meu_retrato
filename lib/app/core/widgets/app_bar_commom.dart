import 'package:flutter/material.dart';
import 'package:my_portrait/app/core/routes/routes_app.dart';

class AppBarCommom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCommom(
      {required this.titulo, required this.reloadDados, super.key});
  final String titulo;
  final VoidCallback reloadDados;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesApp.createPortrait)
                        .then((value) {
                      reloadDados();
                    });
                  },
                  child: const Text('Adicionar'),
                )
              ],
            ),
            const Divider()
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
