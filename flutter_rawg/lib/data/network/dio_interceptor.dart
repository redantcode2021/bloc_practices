import 'package:dio/dio.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final apiKey = dotenv.get('GAMES_API_KEY');

    options.queryParameters['key'] = apiKey;

    return super.onRequest(options, handler);
  }
}
