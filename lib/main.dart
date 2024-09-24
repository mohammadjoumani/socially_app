import 'dart:async';
import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:socially_app/features/generic/presentation/main/view/main_app.dart';

import 'core/app/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ),
  );

  await initAppModule();
  runApp(
    DevicePreview(
      enabled: false,
      isToolbarVisible: false,
      builder: (context) => const MainApp(),
    ),
  );
}
