import 'package:flutter/material.dart';

class ReadQrCodeView extends StatefulWidget {
  const ReadQrCodeView({super.key});

  @override
  State<ReadQrCodeView> createState() => _ReadQrCodeViewState();
}

class _ReadQrCodeViewState extends State<ReadQrCodeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QRCODE')),
    );
  }
}
