import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/app/app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  runApp(const App());
}
