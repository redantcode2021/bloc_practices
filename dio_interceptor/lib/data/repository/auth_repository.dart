import 'dart:async';

import 'package:dio_interceptor/data/endpoints/endpoints.dart';
import 'package:dio_interceptor/data/network/dio_client.dart';
import 'package:dio_interceptor/data/services/locator.dart';

class AuthRepository {
  final networkLocator = getIt.get<DioClient>();

  Future<Map<String, dynamic>> register({
    required String email,
    required String password,
  }) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response = await networkLocator.dio
          .post('${EndPoints.baseUrl}${EndPoints.register}', data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode != 200) {
        throw Exception('Failed to sign up');
      }
      completer.complete(response.data);
    } catch (e) {
      print(e);
    }
    return completer.future;
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    Completer<Map<String, dynamic>> completer =
        Completer<Map<String, dynamic>>();
    try {
      final response = await networkLocator.dio
          .post('${EndPoints.baseUrl}${EndPoints.login}', data: {
        'email': email,
        'password': password,
      });
      //print(response.data.toString());
      if (response.statusCode != 200) {
        throw Exception('Failed to sign in');
      }
      completer.complete(response.data);
    } catch (e) {
      print(e);
    }
    return completer.future;
  }
}
