
import 'dart:convert';

import 'package:prueba_pokemon/models/response_pokemon.dart';

class PokemonEntry {
    PokemonEntry({
        required this.entryNumber,
        required this.pokemonSpecies,
    });

    int entryNumber;
    Language pokemonSpecies;

    factory PokemonEntry.fromJson(String str) => PokemonEntry.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokemonEntry.fromMap(Map<String, dynamic> json) => PokemonEntry(
        entryNumber: json["entry_number"],
        pokemonSpecies: Language.fromMap(json["pokemon_species"]),
    );

    Map<String, dynamic> toMap() => {
        "entry_number": entryNumber,
        "pokemon_species": pokemonSpecies.toMap(),
    };
}