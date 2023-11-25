import 'package:flutter/material.dart';
import 'package:pokemon_battle/app/models/pokemon_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  widget.userPokemon.imageUrl,
                  fit: BoxFit.cover,
                  width: 150,
                ),
                Text(
                  '${widget.userPokemon.name.toUpperCase()} - #${widget.userPokemon.id}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'TOTAL STATS: $userPokemonStatsTotal',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'VS',
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Image.network(
                  widget.opponentPokemon.imageUrl,
                  fit: BoxFit.cover,
                  width: 150,
                ),
                Text(
                  '${widget.opponentPokemon.name.toUpperCase()} - #${widget.opponentPokemon.id}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'TOTAL STATS: $opponentPokemonStatsTotal',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'WIN: ${pokemonWinner.name.toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'RETURN',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
