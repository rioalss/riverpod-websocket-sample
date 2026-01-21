import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get baseUrlWebsocketCoinbase =>
      dotenv.env['API_BASE_URL'] ?? 'https://api.example.com';

  static String get baseUrlWebsocketCentrifuge =>
      dotenv.env['API_BASE_URL_CENTRIFUGE'] ?? 'ws://127.0.0.1:8000/connection/websocket';

  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  static bool get isProduction => dotenv.env['ENVIRONMENT'] == 'production';

  static int get connectTimeout => 30000;

  static int get receiveTimeout => 30000;
}
