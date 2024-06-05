import 'package:flutter_dotenv/flutter_dotenv.dart';

class ConfigEnv {
  static String basePath = 'http://gateway.marvel.com/';
  static String charactersPath = 'v1/public/characters';
  static String apiKey = dotenv.env['API_KEY']!;
  static String hash = dotenv.env['API_HASH']!;
}
