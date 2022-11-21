import 'package:flutter/material.dart';
import 'package:my_portrait/app/app_widget.dart';
import 'package:my_portrait/app/core/injetc/inject_dependencies.dart';

void main() {
  InjectDependencies.main();
  runApp(const AppWidget());
}
