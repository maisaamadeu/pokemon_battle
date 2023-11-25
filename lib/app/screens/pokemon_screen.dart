import 'package:flutter/material.dart';
import 'package:pokemon_battle/app/models/pokemon_model.dart';
import 'package:pokemon_battle/app/repositories/pokemon_repository.dart';
import 'package:pokemon_battle/app/screens/battle_screen.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen(
      {super.key, required this.pokemonModel, required this.typeUrl});

  final PokemonModel pokemonModel;
  final String typeUrl;

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  int totalStats = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    for (var stat in widget.pokemonModel.stats) {
      totalStats += stat.baseStat;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  widget.pokemonModel.imageUrl,
                  fit: BoxFit.cover,
                  width: 200,
                ),
                Text(
                  '${widget.pokemonModel.name.toUpperCase()} - #${widget.pokemonModel.id}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'STATS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      'TOTAL: $totalStats',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.pokemonModel.stats[index].name.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.pokemonModel.stats[index].baseStat
                                .toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: widget.pokemonModel.stats[index].baseStat
                            .toDouble(),
                        max: 255,
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemCount: widget.pokemonModel.stats.length,
                  shrinkWrap: true,
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
                      setState(() {
                        isLoading = true;
                      });
                      PokemonModel opponentPokemon = await PokemonRepository()
                          .getRandomPokemon(widget.typeUrl);

                      setState(() {
                        isLoading = false;
                      });

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BattleScreen(
                            userPokemon: widget.pokemonModel,
                            opponentPokemon: opponentPokemon,
                          ),
                        ),
                      );
                    },
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'BATTLE',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
