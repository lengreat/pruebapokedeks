import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:prueba_pokemon/models/pokemon.dart';

class CardSwiper extends StatelessWidget {
  final List<Pokemon> pokemons;
  const CardSwiper({
    Key? key,
    required this.pokemons
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
          final pokemonA=pokemons[index];
          print(pokemonA.url);

          return GestureDetector(
            onTap: ()=>Navigator.pushNamed(context, 'details', arguments: 'pokemon-instance'),
            child: Column(
              children:const [
                 FadeInImage(
                  //placeholder: NetworkImage(pokemonA.url),
                  placeholder: NetworkImage('https://via.placeholder.com/300x300'),
                  image:  NetworkImage('https://via.placeholder.com/300x300'),
                  fit: BoxFit.cover,
                  ),
                   SizedBox(height: 5,),
                   Text(
                    'data ndnsndnds',
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