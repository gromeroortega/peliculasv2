import 'dart:convert';
import 'package:curso_peliculas_v2/src/models/models.dart';

class Populars {
  Populars({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory Populars.fromJson(String str) => Populars.fromMap(json.decode(str));

  factory Populars.fromMap(Map<String, dynamic> json) => Populars(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
