// To parse this JSON data, do
//
//     final pokedexResponse = pokedexResponseFromMap(jsonString);

import 'dart:convert';

import 'package:prueba_pokemon/models/liga_ciudad.dart';

class PokedexResponse {
    PokedexResponse({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    int count;
    String next;
    dynamic previous;
    List<LigaCiudad> results;//Listado de las ciudades

    factory PokedexResponse.fromJson(String str) => PokedexResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokedexResponse.fromMap(Map<String, dynamic> json) => PokedexResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<LigaCiudad>.from(json["results"].map((x) => LigaCiudad.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
    };
}



