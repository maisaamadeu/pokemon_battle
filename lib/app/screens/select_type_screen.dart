import 'package:flutter/material.dart';
import 'package:pokemon_battle/app/repositories/type_repository.dart';

class SelectTypeScreen extends StatelessWidget {
  const SelectTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: TypeRepository().getAllTypes(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Ocorreu um erro ao buscar os tipos'),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Text(
                          'Selecione um tipo abaixo para encontrar um pokémon:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }

              default:
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      ),
    );
  }
}
