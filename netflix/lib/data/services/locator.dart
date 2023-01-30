import 'package:get_it/get_it.dart';
import 'package:netflix/data/network/dio_client.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<DioClient>(DioClient());
}
