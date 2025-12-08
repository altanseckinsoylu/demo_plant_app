import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkConstants {
  static String get baseUrl => dotenv.env['BASE_URL'] ?? '';
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;
}