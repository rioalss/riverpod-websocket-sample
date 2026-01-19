import 'dart:developer' as dev;

import 'package:example_websocket/app/app.dart';
import 'package:example_websocket/core/di/injection.dart';
import 'package:example_websocket/shared/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await dotenv.load(fileName: Assets.aEnvStaging);
  FlutterError.onError = (details) {
    dev.log(details.exceptionAsString(), stackTrace: details.stack);
  };
  runApp(const ProviderScope(child: MyApp()));
}
