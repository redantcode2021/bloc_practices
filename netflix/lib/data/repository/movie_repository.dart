import 'dart:convert';
import 'package:netflix/data/endpoints/endpoints.dart';
import 'package:netflix/data/network/dio_client.dart';
import 'package:netflix/data/services/locator.dart';
import 'package:netflix/model/configuration.dart';
import 'package:netflix/model/model_barrel.dart';
import 'package:netflix/model/result_error.dart';

class MovieRepository {
  final networkLocator = getIt.get<DioClient>();

  Future<List<Movie>> getTrending({type = 'all', time = 'week'}) async {
    final response = await networkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.trending}/$type/$time',
    );

    print(response.data);

    if (response.statusCode == 200) {
      if (response.data.toString().isNotEmpty) {
        return List<Movie>.from(
          jsonDecode(jsonEncode((response.data)['results'])).map(
            (data) => Movie.fromJson(data),
          ),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingMovies('Error getting movies');
    }
  }

  Future<Movie> getDetails(id, type) async {
    final response = await networkLocator.dio.get(
      '${EndPoints.baseUrl}/$type/$id',
    );

    print('details => ' + response.data);

    if (response.statusCode == 200) {
      if (response.data.toString().isNotEmpty) {
        return Movie.fromJson(
          jsonDecode(
            jsonEncode(response.data),
          ),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingMovies('Error getting a movie');
    }
  }

  Future<Configuration> getConfiguration() async {
    final response = await networkLocator.dio.get(
      '${EndPoints.baseUrl}${EndPoints.configuration}',
    );

    print('configuration => ' + response.data.toString());
    if (response.statusCode == 200) {
      if (response.data.toString().isNotEmpty) {
        return Configuration.fromJson(
          jsonDecode(
            jsonEncode(response.data),
          ),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else {
      throw ErrorGettingMovies('Error getting configuration');
    }
  }
}
