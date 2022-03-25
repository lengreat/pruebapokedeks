import 'dart:convert';

class LigaCiudad {
    LigaCiudad({
        required this.name,
        required this.url,
    });

    String name;
    String url;

    factory LigaCiudad.fromJson(String str) => LigaCiudad.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LigaCiudad.fromMap(Map<String, dynamic> json) => LigaCiudad(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
    };
}