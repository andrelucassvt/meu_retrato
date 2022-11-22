import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_portrait/app/features/home/domain/entity/retratos_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceLocalData {
  static const banco = 'retratos';
  static Future<List<String>> getImageFromPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(banco) ?? [];
  }

  static Future<void> deleteImageFromPreferences(
      RetratosEntity retratosEntity) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = prefs.getStringList(banco) ?? [];
    result.removeWhere(
        (element) => element == jsonEncode(retratosEntity.toJson()));
    prefs.setStringList(banco, result);
  }

  static Future<bool> saveImageToPreferences(
      RetratosEntity retratosEntity) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final lista = prefs.getStringList(banco) ?? [];
    lista.add(jsonEncode(retratosEntity.toJson()));
    return prefs.setStringList(banco, lista);
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }
}
