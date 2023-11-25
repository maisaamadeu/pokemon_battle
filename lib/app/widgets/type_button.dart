import 'package:flutter/material.dart';
import 'package:pokemon_battle/app/models/type_model.dart';

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
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () async {},
        child: const Text(
          'Teste',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
