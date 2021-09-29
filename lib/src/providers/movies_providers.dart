//Powered by zharka
import 'package:curso_peliculas_v2/src/models/models.dart';
import 'package:curso_peliculas_v2/src/models/searchs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  String _apikey = '689b60a9ca482470f05cd372ec59e840';
  String _baseURL = 'api.themoviedb.org';
  String _lenguage = 'es-ES';
  int _page = 0;

  List<Movie> onDisplay = [];
  List<Movie> populars = [];

  Map<int, List<Cast>> casting = {};
  //Contructor de MoviesProvider
  MoviesProvider() {
    print('MoviesProvider Inicializado...');
    //El this para llamar este método es opcional, se usa sólo para que quede MÁS claro.
    this.getMovieSwiper();
    this.getPopulars();
  }

  Future<String> getMovieGeneral(String category, [int page = 1]) async {
    final url = Uri.https(
        _baseURL, category, {'api_key': _apikey, 'language': _lenguage});
    final request = await http.get(url);
    return request.body;
  }

  getMovieSwiper() async {
    final general = await getMovieGeneral('3/movie/now_playing', 1);
    final response = NowPlaying.fromJson(general);
    onDisplay = response.results;
    notifyListeners();
  }

  getPopulars() async {
    _page++;
    final general = await getMovieGeneral('3/movie/now_playing', _page);
    final response = Populars.fromJson(general);
    populars = [...populars, ...response.results];
  }

  Future<List<Cast>> getMoviesCast(int movieId) async {
    //
    if (casting.containsKey(movieId)) return casting[movieId]!;
    print('Haciendo petición http');
    final general = await getMovieGeneral('3/movie/$movieId/credits');
    final response = MovieCast.fromJson(general);
    casting[movieId] = response.cast;
    //print(casting);
    return response.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseURL, '3/search/movie',
        {'api_key': _apikey, 'language': _lenguage, 'query': query});
    final request = await http.get(url);
    final response = Search.fromJson(request.body);
    return response.results;
  }
}
