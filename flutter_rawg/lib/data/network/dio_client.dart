import 'package:dio/dio.dart';

class DioClient {
  final _dio = Dio();
  DioClient();
  Dio get dio => _dio;
}
