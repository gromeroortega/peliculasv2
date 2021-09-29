//Powered by zharka

import 'package:curso_peliculas_v2/src/models/models.dart';
import 'package:curso_peliculas_v2/src/providers/movies_providers.dart';
import 'package:curso_peliculas_v2/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovieSearch extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar película';
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () => query = '', icon: Icon(Icons.cancel))
        ],
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _EmptyContainer();
    } else {
      final moviesProvider =
          Provider.of<MoviesProvider>(context, listen: false);
      return FutureBuilder(
        future: moviesProvider.searchMovies(query),
        builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
          if (!snapshot.hasData) {
            return _EmptyContainer();
          }
          final moviesResults = snapshot.data!;
          return ShowSearch(moviesResults);
        },
      );
    }
  }
}

class _EmptyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Icon(
          Icons.movie,
          color: Colors.cyan.shade200,
          size: 200,
        ),
      ),
    );
  }
}
