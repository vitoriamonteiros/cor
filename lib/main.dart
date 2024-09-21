import 'package:app_cor/app.dart';
import 'package:app_cor/locator.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future<void>main() async {
  await GetStorage.init(); // o GetStorage está gravando o app

  setupDependence();

  runApp(const MyApp());
}




