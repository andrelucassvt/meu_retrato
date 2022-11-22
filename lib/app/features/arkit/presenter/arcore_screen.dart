import 'package:flutter/material.dart';

class ArcoreScreen extends StatefulWidget {
  const ArcoreScreen({super.key});

  @override
  State<ArcoreScreen> createState() => _ArcoreScreenState();
}

class _ArcoreScreenState extends State<ArcoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ARCORE')),
    );
  }
}
