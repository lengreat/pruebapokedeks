import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_pokemon/providers/pokedex_provider.dart';
import 'package:prueba_pokemon/widgets/widgets.dart';

class  HomeScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {

    final ciudadesProvider=Provider.of<PokeProvider>(context);//llamo al provider de ciudades

    //print (pokemonProvider.onDisplay);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        elevation: 0,
        actions: [
          IconButton(onPressed: (){}, 
          icon: const Icon(Icons.search))
        ],
      ),
      body: Column(
        children:  [
           CardSwiper(ciudades: ciudadesProvider.onDisplay, pokemons: ciudadesProvider.onDisplay2,),
           //Text('ddsdsd')
        ],
      )
    );
  }
}