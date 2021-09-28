import 'package:curso_peliculas_v2/src/models/models.dart';
import 'package:curso_peliculas_v2/src/providers/movies_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  final int movieId;

  const CastingCards(this.movieId);

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
      future: movies.getMoviesCast(movieId),
      builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
        if (!snapshot.hasData) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 180),
            child: CircularProgressIndicator(),
          );
        } else {
          final actors = snapshot.data!;
          //print(actores?[0].gender);

          return Container(
            margin: EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 180,
            //color: Colors.red,
            child: ListView.builder(
                itemCount: actors.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) => _ActorCard(actors[index])),
          );
        }
      },
    );
  }
}

class _ActorCard extends StatelessWidget {
  final Cast actors;

  const _ActorCard(this.actors);
  @override
  Widget build(BuildContext context) {
    //String? name = actors?.name;
    return Container(
      width: 110,
      height: 120,
      //color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
                height: 140,
                width: 100,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(actors.fullProfilePath)),
          ),
          SizedBox(
            height: 3.0,
          ),
          Text(
            actors.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
