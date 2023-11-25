import 'package:flutter/material.dart';
import 'package:pokemon_battle/app/models/pokemon_model.dart';
import 'package:pokemon_battle/app/models/type_model.dart';
import 'package:pokemon_battle/app/repositories/pokemon_repository.dart';
import 'package:pokemon_battle/app/screens/pokemon_screen.dart';

class TypeButton extends StatelessWidget {
  const TypeButton({super.key, required this.typeModel});

  final TypeModel typeModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 200,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: typeModel.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () async {
          final PokemonModel pokemonModel =
              await PokemonRepository().getRandomPokemon(typeModel.url);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => PokemonScreen(
                  pokemonModel: pokemonModel, typeUrl: typeModel.url),
            ),
          );
        },
        child: Text(
          typeModel.name[0].toUpperCase() + typeModel.name.substring(1),
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
