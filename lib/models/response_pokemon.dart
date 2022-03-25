// To parse this JSON data, do
//
//     final pokemonResponse = pokemonResponseFromMap(jsonString);

import 'dart:convert';

import 'package:prueba_pokemon/models/pokemon.dart';

class PokemonResponse {
    PokemonResponse({
        required this.descriptions,
        required this.id,
        required this.isMainSeries,
        required this.name,
        required this.names,
        required this.pokemonEntries,
        required this.region,
        required this.versionGroups,
    });

    List<Description> descriptions;
    int id;
    bool isMainSeries;
    String name;
    List<Name> names;
    List<PokemonEntry> pokemonEntries;
    dynamic region;
    List<dynamic> versionGroups;

    factory PokemonResponse.fromJson(String str) => PokemonResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PokemonResponse.fromMap(Map<String, dynamic> json) => PokemonResponse(
        descriptions: List<Description>.from(json["descriptions"].map((x) => Description.fromMap(x))),
        id: json["id"],
        isMainSeries: json["is_main_series"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromMap(x))),
        pokemonEntries: List<PokemonEntry>.from(json["pokemon_entries"].map((x) => PokemonEntry.fromMap(x))),
        region: json["region"],
        versionGroups: List<dynamic>.from(json["version_groups"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "descriptions": List<dynamic>.from(descriptions.map((x) => x.toMap())),
        "id": id,
        "is_main_series": isMainSeries,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toMap())),
        "pokemon_entries": List<dynamic>.from(pokemonEntries.map((x) => x.toMap())),
        "region": region,
        "version_groups": List<dynamic>.from(versionGroups.map((x) => x)),
    };
}

class Description {
    Description({
        required this.description,
        required this.language,
    });

    String description;
    Language language;

    factory Description.fromJson(String str) => Description.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Description.fromMap(Map<String, dynamic> json) => Description(
        description: json["description"],
        language: Language.fromMap(json["language"]),
    );

    Map<String, dynamic> toMap() => {
        "description": description,
        "language": language.toMap(),
    };
}

class Language {
    Language({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory Language.fromJson(String str) => Language.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Language.fromMap(Map<String, dynamic> json) => Language(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}

class Name {
    Name({
        required this.language,
        required this.name,
    });

    Language language;
    String name;

    factory Name.fromJson(String str) => Name.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Name.fromMap(Map<String, dynamic> json) => Name(
        language: Language.fromMap(json["language"]),
        name: json["name"],
    );

    Map<String, dynamic> toMap() => {
        "language": language.toMap(),
        "name": name,
    };
}

