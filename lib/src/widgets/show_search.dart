import 'package:curso_peliculas_v2/src/models/models.dart';
import 'package:flutter/material.dart';

class ShowSearch extends StatelessWidget {
  final List<Movie> results;

  ShowSearch(this.results);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (_, int index) {
        return ListTile(
          leading: FadeInImage(
              width: 50,
              height: 100,
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(results[index].fullPosterPath)),
          title: Text(results[index].originalTitle),
          subtitle: Text(results[index].title),
          onTap: () => Navigator.pushNamed(context, 'details',
              arguments: results[index]),
        );
      },
    );
  }
}
