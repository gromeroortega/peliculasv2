// Powered by Zharka
import 'dart:convert';
import 'models.dart';

class NowPlaying {
  //Contructor de la clase, con los argumentos que espera recibir.
  NowPlaying({
    this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  //Propiedades de la clase
  Dates? dates;
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  //Factory constructor que toma la respuesta JSON y la decodifica.
  //NOTE: Esto =>, es igual a new NombredelaClase (){}
  /* El NowPlaying.from Json recibe un String llamado str crea una nueva 
  instancia de NowPlaying con la infromación mapeada que se necesita*/
  factory NowPlaying.fromJson(String str) =>
      NowPlaying.fromMap(json.decode(str));

  //Factory contructor que recorre la respuesta y coloca los datos en su lugar.
  factory NowPlaying.fromMap(Map<String, dynamic> json) => NowPlaying(
        dates: Dates?.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromJson(String str) => Dates.fromMap(json.decode(str));

  factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );
}
