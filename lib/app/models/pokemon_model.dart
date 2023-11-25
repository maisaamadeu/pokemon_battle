import 'package:pokemon_battle/app/models/stat_model.dart';

class PokemonModel {
  PokemonModel({
    required this.id,
    required this.name,
    required this.stats,
    required this.weight,
  });

  late final int id;
  late final String name;
  late final List<StatModel> stats;
  late final int weight;

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stats = List.from(json['stats']).map((e) => StatModel.fromJson(e)).toList();
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'stats': stats.map((e) => e.toJson()).toList(),
      'weight': weight,
    };
  }
}
