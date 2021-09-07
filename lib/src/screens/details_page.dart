//Powered by zharka
import 'package:curso_peliculas_v2/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: Cambiar por una instancia de Movie

    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movies';
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate(
                [_PosterTitle(), _Overview(), _Overview(), CastingCards()]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.cyan,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          width: double.infinity,
          color: Colors.black12,
          alignment: Alignment.bottomCenter,
          child: Text(
            'Movie.title',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x600'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150.0,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movie.title',
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Original.title',
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_outline,
                    size: 18,
                    color: Colors.cyan,
                  ),
                  Text(
                    '4.5',
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Ad duis ex et reprehenderit eiusmod dolor consequat tempor magna esse occaecat. Sit cillum anim ipsum cupidatat commodo commodo cupidatat ullamco enim et nisi labore commodo Lorem. Dolore reprehenderit qui excepteur do dolor pariatur aliquip dolore aute. Consequat pariatur incididunt elit non laboris sint enim enim anim anim enim eu culpa fugiat. Ut tempor officia veniam tempor deserunt. Nulla irure id voluptate est ipsum esse sit Lorem fugiat qui. ',
        style: Theme.of(context).textTheme.subtitle1,
        textAlign: TextAlign.justify,
      ),
    );
  }
}
