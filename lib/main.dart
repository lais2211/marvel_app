import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/app_module.dart';
import 'package:marvel_app/app/app_widget.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
