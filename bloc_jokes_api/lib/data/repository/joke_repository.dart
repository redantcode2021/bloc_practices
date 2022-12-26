import 'package:bloc_jokes_api/data/model/joke_model.dart';
import 'package:http/http.dart' as http;

class JokeRepository {
  final String _baseUrl = "https://v2.jokeapi.dev/joke/Any";

  Future<JokeModel> getJokes() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return jokeModelFromJson(response.body);
    } else {
      throw Exception("Failed to load Joke");
    }
  }
}
