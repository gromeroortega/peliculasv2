//Powered by zharka
import 'package:curso_peliculas_v2/src/providers/movies_providers.dart';
import 'package:curso_peliculas_v2/src/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

//Clase para manejar el estado de la aplicación. Se ejecunta ates que MyApp()
class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //EL MultiProvider contine instancias de providers simples.
    //*Lazy* es la propiedad que instacia el provider cuando se necesite.
    //Se pasa en false para que se dispare en cuento inicie la aplicación.
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => MoviesProvider(),
        lazy: false,
      )
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {'home': (_) => HomeScreen(), 'details': (_) => DetailsScreen()},
      theme: ThemeData.light()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.cyan)),
    );
  }
}
