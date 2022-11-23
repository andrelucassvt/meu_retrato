import 'package:flutter/material.dart';
import 'package:my_portrait/app/core/database/preference/preference_local_data.dart';

class TutotialScreen extends StatefulWidget {
  const TutotialScreen({super.key});

  @override
  State<TutotialScreen> createState() => _TutotialScreenState();
}

class _TutotialScreenState extends State<TutotialScreen> {
  TextStyle _textStyle = TextStyle(color: Colors.white);
  TextStyle _textStylePassos = TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Tutorial'),
        centerTitle: false,
        backgroundColor: Colors.black,
        elevation: 2.0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () async {
              await PreferenceLocalData.salvarPrimeiroAcesso();
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.cancel),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  'Bem vindo ao "Meu retrato", aqui você transforma QRCODE em retratos interativos com sua câmera.',
                  style: _textStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Primeiro passo',
                  style: _textStylePassos,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Adicione um retrato no botão "adicionar" e depois preencha todos os requisitos da tela seguinte.',
                  style: _textStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset('assets/tutorial/home.jpg'),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Segundo passo',
                  style: _textStylePassos,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Depois que salvar o retrato, você será direcionado para tela de exportar o QRCODE.\nRecomendados que você imprima o QRCODE e cole na sua parede ou onde desejar para ter a imersão correta',
                  style: _textStyle,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset('assets/tutorial/qrcode.jpg'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Depois clique no botão "visualizar" e escolha o tipo de visualização e aponte a câmera para o QRCODE',
                  style: _textStyle,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
