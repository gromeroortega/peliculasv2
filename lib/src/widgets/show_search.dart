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
        final movie = results[index];
        movie.heroId = 'search-${movie.id}';
        return ListTile(
          leading: Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: FadeInImage(
                  fit: BoxFit.contain,
                  width: 50,
                  height: 100,
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterPath)),
            ),
          ),
          title: Text(movie.originalTitle),
          subtitle: Text(movie.title),
          onTap: () =>
              Navigator.pushNamed(context, 'details', arguments: movie),
        );
      },
    );
  }
}
