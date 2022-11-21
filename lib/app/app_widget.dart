import 'package:flutter/material.dart';
import 'package:my_portrait/app/core/routes/routes_app.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: RoutesApp.routes,
    );
  }
}
