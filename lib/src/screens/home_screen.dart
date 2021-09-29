//Powered by zharka

import 'package:curso_peliculas_v2/src/providers/movies_providers.dart';
import 'package:flutter/material.dart';

import 'package:curso_peliculas_v2/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Provider.of(context) busca en le arbol de widgets la primera instancia
    //del provider especificado (MoviesProvider) en el multiprovider.
    //Si no existe una instacia del provider la crea.
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () =>
                  showSearch(context: context, delegate: MovieSearch()),
              icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10.0),
              child: CardSwiper(
                movies: moviesProvider.onDisplay,
              )),
          MovieSlider(
              movies: moviesProvider.populars,
              title: 'Populares',
              onPage: () {
                moviesProvider.getPopulars();
              }),
        ],
      ),
    );
  }
}
