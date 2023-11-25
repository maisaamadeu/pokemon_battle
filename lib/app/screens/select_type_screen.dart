import 'package:flutter/material.dart';
import 'package:pokemon_battle/app/models/type_model.dart';
import 'package:pokemon_battle/app/repositories/type_repository.dart';
import 'package:pokemon_battle/app/widgets/type_button.dart';

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
                if (snapshot.hasError || !snapshot.hasData) {
                  return const Center(
                    child: Text('Ocorreu um erro ao buscar os tipos'),
                  );
                } else {
                  List<TypeModel> types = snapshot.data!;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        const Text(
                          'Select a type below to find a Pokémon:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              mainAxisExtent: 70,
                              maxCrossAxisExtent: 200,
                            ),
                            itemBuilder: (context, index) => TypeButton(
                              typeModel: types[index],
                            ),
                            itemCount: types.length,
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
