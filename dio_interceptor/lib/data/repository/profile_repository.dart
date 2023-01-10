import 'package:dio_interceptor/data/endpoints/endpoints.dart';
import 'package:dio_interceptor/data/network/dio_client.dart';
import 'package:dio_interceptor/data/services/locator.dart';
import 'package:dio_interceptor/data/sharedprefs/shared_preference_helper.dart';

class ProfileRepository {
  final networkLocator = getIt.get<DioClient>();
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();

  Future<String> getUserProfiles() async {
    final response = await networkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.users}2',
      // options: Options(
      //   headers: {'Authorization': '${sharedPrefLocator.getUserToken()}'},
      // ),
    );
    return response.data["data"]["first_name"];
  }
}
