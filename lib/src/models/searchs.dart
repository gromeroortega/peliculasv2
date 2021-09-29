//Powered by zharka
import 'dart:convert';

import 'package:curso_peliculas_v2/src/models/models.dart';

class Search {
  Search({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory Search.fromJson(String str) => Search.fromMap(json.decode(str));

  factory Search.fromMap(Map<String, dynamic> json) => Search(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}
