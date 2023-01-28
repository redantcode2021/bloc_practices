import 'package:flutter_rawg/data/network/dio_client.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<DioClient>(DioClient());
}
