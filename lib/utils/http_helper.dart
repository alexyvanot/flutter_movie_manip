import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_manip/model/movie.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String urlBase = "https://api.themoviedb.org/3/movie";
  final String urlUpComing = "/upcoming?";
  final String urlLanguage = "&language=fr-FR";
  final String? apiKey = dotenv.env['API_KEY'];

  Future<List<Movie>> getUpComing() async {
    if (apiKey == null) {
      throw Exception("API key is missing.");
    }
    final String url = "$urlBase$urlUpComing&api_key=$apiKey$urlLanguage";
    http.Response result = await http.get(Uri.parse(url));

    if (result.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(result.body);
      final List moviesResponseList = jsonResponse["results"];
      List<Movie> movies =
          moviesResponseList.map((movie) => Movie.fromJson(movie)).toList();
      return movies;
    } else {
      return [];
    }
  }
}
