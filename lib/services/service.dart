import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex_app/model/pokemon_model.dart';

class Service {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokeList() async {
    List<PokemonModel> list = [];

    var response = await Dio().get(_url);
    var pokeList = jsonDecode(response.data)['pokemon'];

    if (pokeList is List) {
      list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return list;
  }
}
