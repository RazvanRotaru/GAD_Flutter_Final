import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_db/models/index.dart';

class MovieApi {
  MovieApi({this.url = 'https://yts.mx/api/v2'}) : client = Client();

  final String url;
  final Client client;

  Future<List<Movie>> getMovies({required int page}) async {
    final Uri uri = Uri.parse('$url/list_movies.json?page=$page');
    final Response resp = await client.get(uri);

    if (resp.statusCode >= 400) {
      throw StateError('Unsuccessful connection: ${resp.body}');
    }

    // await Future<int>.delayed(const Duration(seconds: 2));

    final Map<dynamic, dynamic> body = jsonDecode(resp.body) as Map<dynamic, dynamic>;
    final Map<dynamic, dynamic> data = body['data'] as Map<dynamic, dynamic>;
    final List<dynamic> movies = data['movies'] as List<dynamic>;

    return movies //
        .map((dynamic json) => Movie.fromJson(json))
        .toList();
  }
}
