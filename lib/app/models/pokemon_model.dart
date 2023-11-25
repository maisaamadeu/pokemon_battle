import 'package:equatable/equatable.dart';
import 'package:pokemon_battle/app/models/stat_model.dart';

class PokemonModel extends Equatable {
  PokemonModel({
    required this.id,
    required this.name,
    required this.stats,
    required this.imageUrl,
  });

  late final int id;
  late final String name;
  late final List<StatModel> stats;
  late final String imageUrl;

  PokemonModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stats = List.from(json['stats']).map((e) => StatModel.fromJson(e)).toList();
    imageUrl =
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${json['id']}.png';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'stats': stats.map((e) => e.toJson()).toList(),
      'image_url': imageUrl,
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        stats,
        imageUrl,
      ];
}
