import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:photo_gallery/app/presentation/app_root.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => AppRoot(),
    ),
  );
}