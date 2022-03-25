import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_pokemon/models/liga_ciudad.dart';
import 'package:prueba_pokemon/models/pokemon.dart';
import 'package:prueba_pokemon/models/response.dart';
import 'package:prueba_pokemon/models/response_pokemon.dart';


class PokeProvider extends ChangeNotifier{
  String _baseUrl='pokeapi.co';
  String path2='';

  List<LigaCiudad>onDisplay=[];//creacion del listado
  List<PokemonEntry>onDisplay2=[];//creacion del listado


  PokeProvider(){
    print('Inicializado');
    this.getOnDisplay();
  }

  getOnDisplay()async{
    //print('getOndisplay');
    int indice=0;
    var url =Uri.https(_baseUrl, '/api/v2/pokedex/',);

     // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    //final Map<String, dynamic> decodeDate=json.decode(response.body);
    final Respuesta=PokedexResponse.fromJson(response.body);//Mapeando
    print(Respuesta.results[1].name);

   //----------------------------------
   for (int i=0;i<Respuesta.results.length;i++){
        if (Respuesta.results[i].name=='kanto')
            indice=i;
    }
    var url2= Uri.https(_baseUrl, '/api/v2/pokedex/'+ indice.toString(),);
    final response2=await http.get(url2);
    //final Map<String, dynamic> decodeDate=json.decode(response2.body);
    final Respuesta2=PokemonResponse.fromJson(response2.body);
    print(response2.body);
    print(Respuesta2.pokemonEntries[3].entryNumber);
    print(Respuesta2.pokemonEntries[3].pokemonSpecies.name);

    

  onDisplay=Respuesta.results;//se guardan las ciudades o regiones
  onDisplay2=Respuesta2.pokemonEntries;//se guarda listado de pokemones
  notifyListeners();//redibujado

  }

  //https://pokeapi.co/api/v2/pokedex/
}