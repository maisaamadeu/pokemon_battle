import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:pokemon_battle/app/models/pokemon_model.dart';

class PokemonRepository {
  Future<PokemonModel> getRandomPokemon(String url) async {
    try {
      final http.Response response = await http.get(Uri.parse(url));

      final List<dynamic> results =
          json.decode(response.body)['pokemon'] as List;

      final int randomIndex = Random().nextInt(results.length);

      final http.Response responseRandomPokemon = await http.get(
        Uri.parse(
          results[randomIndex]['pokemon']['url'],
        ),
      );

      final resultsRandomPokemon = json.decode(responseRandomPokemon.body);

      final PokemonModel pokemonModel =
          PokemonModel.fromJson(resultsRandomPokemon);

      return pokemonModel;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
