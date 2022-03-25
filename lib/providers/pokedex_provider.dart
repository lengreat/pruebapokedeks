import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_pokemon/models/pokemon.dart';
import 'package:prueba_pokemon/models/response.dart';


class PokeProvider extends ChangeNotifier{
  String _baseUrl='pokeapi.co';

  List<Pokemon>onDisplay=[];//creacion del listado


  PokeProvider(){
    print('Inicializado');
    this.getOnDisplay();
  }

  getOnDisplay()async{
    //print('getOndisplay');
    var url =
      Uri.https(_baseUrl, '/api/v2/pokedex/',);

  // Await the http get response, then decode the json-formatted response.
  final response = await http.get(url);
  //final Map<String, dynamic> decodeDate=json.decode(response.body);
  final Respuesta=PokedexResponse.fromJson(response.body);
  //print(Respuesta.results[2].name);

  onDisplay=Respuesta.results;
  notifyListeners();//redibujado

  }

  //https://pokeapi.co/api/v2/pokedex/
}