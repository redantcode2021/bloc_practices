import 'dart:convert';

import 'package:flutter_rawg/data/endpoints/endpoints.dart';
import 'package:flutter_rawg/data/network/dio_client.dart';
import 'package:flutter_rawg/data/services/locator.dart';
import 'package:flutter_rawg/model/genre.dart';

import '../../model/result_error.dart';

class GameRepository {
  final networkLocator = getIt.get<DioClient>();

  Future<List<Genre>> getGenres() async {
    final response = await networkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.genres}',
    );

    //print((response.data)['results']);

    if (response.statusCode == 200) {
      if (response.data.toString().isNotEmpty) {
        return List<Genre>.from(
          jsonDecode(jsonEncode((response.data)['results'])).map(
            (data) => Genre.fromJson(data),
          ),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingGames("Error getting genres");
    }
  }
}