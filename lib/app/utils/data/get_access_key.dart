import 'package:flutter_dotenv/flutter_dotenv.dart';

String? getAccessKey() {
  if (!dotenv.isInitialized) {
    return null;
  }
  return dotenv.env['ACCESS_KEY'];
}