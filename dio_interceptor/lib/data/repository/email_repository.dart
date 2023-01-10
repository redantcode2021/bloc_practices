import 'package:dio_interceptor/data/endpoints/endpoints.dart';
import 'package:dio_interceptor/data/network/dio_client.dart';
import 'package:dio_interceptor/data/services/locator.dart';
import 'package:dio_interceptor/data/sharedprefs/shared_preference_helper.dart';

class EmailRepository {
  final networkLocator = getIt.get<DioClient>();
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();

  Future<String> getEmail({required String id}) async {
    final response = await networkLocator.dio.get(
      "${EndPoints.baseUrl}${EndPoints.users}$id",
      // options: Options(
      //   headers: {"Authorization": "${sharedPrefLocator.getUserToken()}"},
      // ),
    );
    print(response.data);
    return response.data["data"]["email"];
  }
}
