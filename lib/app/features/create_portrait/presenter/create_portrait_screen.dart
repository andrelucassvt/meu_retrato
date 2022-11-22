import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_portrait/app/core/convert/convert_data.dart';
import 'package:my_portrait/app/features/create_portrait/presenter/cubit/create_protrait_cubit.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';
import 'package:my_portrait/app/features/home/presenter/widgets/comprovante_dados.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class CreatePortraitScreen extends StatefulWidget {
  const CreatePortraitScreen({super.key});

  @override
  State<CreatePortraitScreen> createState() => _CreatePortraitScreenState();
}

class _CreatePortraitScreenState extends State<CreatePortraitScreen> {
  final _cubit = GetIt.I.get<CreateProtraitCubit>();
  final TextEditingController textEditingController = TextEditingController();
  final WidgetsToImageController controllerScreenWidget =
      WidgetsToImageController();
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  Future<void> _importarImagem() async {
    if (image != null) {
      image = null;
      _chamarPickerImage();
    } else {
      _chamarPickerImage();
    }
  }

  Future<void> _chamarPickerImage() async {
    final imagePath = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = imagePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _salvarRetrato(),
        label: const Text('Salvar'),
        icon: const Icon(Icons.save),
        backgroundColor: Colors.green,
      ),
      appBar: AppBar(
        title: const Text(
          'Criar retrato',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black, size: 18),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline))
        ],
      ),
      body: BlocConsumer<CreateProtraitCubit, CreateProtraitState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is CreateProtraitError) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red,
              content:
                  Text('Não foi possivel salvar seu retrato. Tente novamente'),
            ));
          } else if (state is CreateProtraitSucesso) {
            Navigator.of(context).popUntil((route) => route.isFirst);
            showModalBottomSheet(
                context: context,
                builder: (ctx) => ComprovanteDadosScreen(
                    retratosEntity: state.retratosEntity));
          }
        },
        builder: (context, state) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nome:',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: TextFormField(
                          controller: textEditingController,
                          onChanged: (value) {
                            setState(() {
                              textEditingController.text = value;
                              textEditingController.selection =
                                  TextSelection.collapsed(
                                      offset:
                                          textEditingController.text.length);
                            });
                          },
                          decoration: const InputDecoration.collapsed(
                              hintText: 'Nome do retrato'),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _importarImagem();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(image == null
                              ? 'Importar retrato'
                              : 'Mudar retrato'),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(Icons.image_rounded)
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (image != null) ...[
                      SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.file(File(image!.path))),
                      const Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      WidgetsToImage(
                        controller: controllerScreenWidget,
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(
                                textEditingController.text,
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              QrImage(
                                data: image!.path,
                                size: 240,
                              ),
                            ],
                          ),
                        ),
                      )
                    ]
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _salvarRetrato() async {
    if (textEditingController.text.isEmpty || image == null) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text(
            'Atenção',
            style: TextStyle(color: Colors.red),
          ),
          content: const Text('O titulo e o retrato devem ser preenchidos'),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      _salvarBytes();
    }
  }

  _salvarBytes() async {
    final qrBytes = await controllerScreenWidget.capture();
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.jpg').create();
    file.writeAsBytesSync(qrBytes!);

    final imageBytes = await image!.readAsBytes();
    _cubit.salvarRetratoLocal(RetratosEntity(
      qrCode: file.path,
      imagem: ConvertData.base64String(imageBytes),
      titulo: textEditingController.text,
    ));
  }
}
