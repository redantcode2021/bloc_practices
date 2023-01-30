import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final apiKey = dotenv.get('TMDB_MOVIE_KEY');
    options.queryParameters['api_key'] = apiKey;

    return super.onRequest(options, handler);
  }
}
