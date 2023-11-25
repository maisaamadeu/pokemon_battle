import 'package:flutter/material.dart';
import 'package:pokemon_battle/app/models/pokemon_model.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key, required this.pokemonModel});

  final PokemonModel pokemonModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Image.network(
                pokemonModel.imageUrl,
                fit: BoxFit.cover,
                width: 200,
              ),
              Text(
                '${pokemonModel.name.toUpperCase()} - #${pokemonModel.id}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ListView.separated(
                itemBuilder: (context, index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(pokemonModel.stats[index].name),
                  ],
                ),
                shrinkWrap: true,
                separatorBuilder: (_, __) => SizedBox(height: 10),
                itemCount: pokemonModel.stats.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
