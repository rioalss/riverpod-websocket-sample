import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String get baseUrlWebsocket =>
      dotenv.env['API_BASE_URL'] ?? 'https://api.example.com';

  static String get apiKey => dotenv.env['API_KEY'] ?? '';

  static bool get isProduction => dotenv.env['ENVIRONMENT'] == 'production';

  static int get connectTimeout => 30000;

  static int get receiveTimeout => 30000;
}
