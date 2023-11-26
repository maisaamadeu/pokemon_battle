import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pokemon_battle/app/models/pokemon_model.dart';
import 'package:pokemon_battle/app/widgets/custom_elevated_button.dart';

class BattleScreen extends StatefulWidget {
  const BattleScreen(
      {super.key, required this.userPokemon, required this.opponentPokemon});

  final PokemonModel userPokemon;
  final PokemonModel opponentPokemon;

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  int userPokemonStatsTotal = 0;
  int opponentPokemonStatsTotal = 0;
  late PokemonModel pokemonWinner;

  @override
  void initState() {
    super.initState();

    for (var stat in widget.userPokemon.stats) {
      userPokemonStatsTotal += stat.baseStat;
    }

    for (var stat in widget.opponentPokemon.stats) {
      opponentPokemonStatsTotal += stat.baseStat;
    }

    if (userPokemonStatsTotal > opponentPokemonStatsTotal) {
      pokemonWinner = widget.userPokemon;
    } else {
      pokemonWinner = widget.opponentPokemon;
    }
  }

  Widget buildPokemon(
      {required String imageUrl,
      required String name,
      required int id,
      required int stats}) {
    return Column(
      children: [
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: 150,
        ),
        Text(
          '${name.toUpperCase()} - #$id',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'TOTAL STATS: $stats',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                buildPokemon(
                  imageUrl: widget.userPokemon.imageUrl,
                  name: widget.userPokemon.name,
                  id: widget.userPokemon.id,
                  stats: userPokemonStatsTotal,
                ),
                const Text(
                  'VS',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                buildPokemon(
                  imageUrl: widget.opponentPokemon.imageUrl,
                  name: widget.opponentPokemon.name,
                  id: widget.opponentPokemon.id,
                  stats: opponentPokemonStatsTotal,
                ),
                const SizedBox(height: 20),
                Text(
                  "WINNER: ${pokemonWinner.name.toUpperCase()}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                )
                    .animate(
                      onPlay: (controller) => controller.repeat(),
                    )
                    .shimmer(
                      duration: 1000.ms,
                    )
                    .scaleXY(
                      begin: 1.5,
                      end: 0.8,
                      curve: Curves.easeInOut,
                      duration: 1000.ms,
                    )
                    .then()
                    .scaleXY(
                      begin: 0.8,
                      end: 1.5,
                      curve: Curves.easeInOut,
                      duration: 1000.ms,
                    ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  buttonText: 'RETURN',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
