import 'package:dio/dio.dart';

import 'config_env.dart';

Dio registerDio() {
  final dio = Dio();
  dio.options.baseUrl = ConfigEnv.basePath;

  return dio;
}
