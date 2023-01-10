import 'dart:convert';

import 'package:dio_interceptor/data/endpoints/endpoints.dart';
import 'package:dio_interceptor/data/network/dio_client.dart';
import 'package:dio_interceptor/data/services/locator.dart';
import 'package:dio_interceptor/data/sharedprefs/shared_preference_helper.dart';
import 'package:dio_interceptor/model/user.dart';

class HomeRepository {
  final networkLocator = getIt.get<DioClient>();
  final sharedPrefLocator = getIt.get<SharedPreferenceHelper>();

  Future<List<Datum?>> getAllUsers() async {
    final response = await networkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.allUsers}',
      // options: Options(headers: {
      //   'Authorization': '${sharedPrefLocator.getUserToken()}',
      //   'Content-Type': 'application/json'
      // }),
    );

    // final validMap =
    jsonDecode(json.encode(response.data)) as Map<String, dynamic>;

    // print(validMap);

    if (response.statusCode == 200) {
      List<dynamic> listUser = jsonDecode(jsonEncode(response.data["data"]));
      print(listUser);
      List<Datum> users = listUser.map((e) => Datum.fromJson(e)).toList();
      return users;
    } else {
      return [];
    }

    //final data = (validMap as List).map((e) => User.fromJson(e)).toList();
  }
}
