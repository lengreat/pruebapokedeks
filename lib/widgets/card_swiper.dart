import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:prueba_pokemon/models/liga_ciudad.dart';
import 'package:prueba_pokemon/models/pokemon.dart';

class CardSwiper extends StatelessWidget {
  final List<LigaCiudad> ciudades;
  final List<PokemonEntry> pokemons;
  const CardSwiper({
    Key? key,
    required this.ciudades,
    required this.pokemons,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height*0.7,
      //color: Colors.green,
      child: Swiper(
        itemCount: pokemons.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*0.6,
        itemHeight: size.height*0.5,
        itemBuilder: (_,int index){
          //final ciudad=ciudades[index];
          final pokemon=pokemons[index];
          //print(ciudad.url);//urls de ciudades
          print(pokemon.pokemonSpecies.name);
           String nombre=pokemon.pokemonSpecies.name;
           int numImagen=0;
           String rutaImagen='';
           String indice=(index+1).toString();
           print(indice);
           if ((index+1)<10){
              rutaImagen='assets/00'+indice+'.png';
             print(rutaImagen);}
           else{
             if((index+1)>10 && (index+1)<100){
              rutaImagen='assets/0' +indice+'.png';
              print(rutaImagen);}
              
              else
              if ((index+1)>=100 && (index+1)<152){
                rutaImagen='assets/' +indice+'.png';
                print(rutaImagen);
              }
              else
                 rutaImagen='assets/001.png';
           }
           //print (pokemons.length);



          return GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'details', arguments: 'pokemon-instance'),
            child: Column(
              children:[
                  FadeInImage(
                  placeholder: AssetImage('assets/001.png'),
                  image:  AssetImage(rutaImagen),
                  //placeholder: NetworkImage('https://via.placeholder.com/300x300'),
                  //image:  NetworkImage('https://via.placeholder.com/300x300'),
                  fit: BoxFit.cover,
                  ),
                   const SizedBox(height: 5,),
                   Text(
                    nombre,
                    overflow: TextOverflow.ellipsis,
                    //style: Theme.of(context).textTheme.headline4,
                    )
              ],
            ),
          );
        },
      ),
    );
  }
}