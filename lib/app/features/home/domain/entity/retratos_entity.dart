import 'dart:convert';

class RetratosEntity {
  final String qrCode;
  final String imagem;
  final String titulo;
  RetratosEntity({
    required this.qrCode,
    required this.imagem,
    required this.titulo,
  });

  Map<String, dynamic> toMap() {
    return {
      'qrCode': qrCode,
      'imagem': imagem,
      'titulo': titulo,
    };
  }

  factory RetratosEntity.fromMap(Map<String, dynamic> map) {
    return RetratosEntity(
      qrCode: map['qrCode'] ?? '',
      imagem: map['imagem'] ?? '',
      titulo: map['titulo'] ?? '',
    );
  }

  static List<RetratosEntity> fromJsonList(List list) {
    return list.map((e) => RetratosEntity.fromJson(json.decode(e))).toList();
  }

  String toJson() => json.encode(toMap());

  factory RetratosEntity.fromJson(String source) =>
      RetratosEntity.fromMap(json.decode(source));

  RetratosEntity copyWith({
    String? qrCode,
    String? imagem,
    String? titulo,
  }) {
    return RetratosEntity(
      qrCode: qrCode ?? this.qrCode,
      imagem: imagem ?? this.imagem,
      titulo: titulo ?? this.titulo,
    );
  }
}
