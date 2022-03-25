import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_pokemon/providers/pokedex_provider.dart';
import 'package:prueba_pokemon/screens/screens.dart';



void main() => runApp(Appstate());


class Appstate extends StatelessWidget {
  const Appstate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_)=> PokeProvider(), lazy: false,)
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home':(_) => HomeScreen(),
        'details': (_)=> Details(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          color: Colors.red,
        )
      ),
    );
  }
}