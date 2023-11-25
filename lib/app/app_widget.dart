import 'package:flutter/material.dart';
import 'package:pokemon_battle/app/screens/select_type_screen.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SelectTypeScreen(),
    );
  }
}
