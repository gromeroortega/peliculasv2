import 'package:flutter/material.dart';

import 'package:curso_peliculas_v2/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Column(
        children: [
          //TODO: CardSwiper
          CardSwiper()

          //
        ],
      ),
    );
  }
}
