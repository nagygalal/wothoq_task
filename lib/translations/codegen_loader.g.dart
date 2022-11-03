// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "hello_message": "مرحبا بك في التطبيق",
  "lang": "اللغة",
  "alert_desc": "لتغيير اللغه الخاصه بالتطبيق",
  "add_cart": "إضافة للسلة"
};
static const Map<String,dynamic> en = {
  "hello_message": "Welcome to App",
  "lang": "Language",
  "alert_desc": "To change the language of the application",
  "add_cart": "Add TO Cart"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
