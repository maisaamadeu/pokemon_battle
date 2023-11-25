import 'dart:convert';
import 'dart:io';

import 'package:pokemon_battle/app/models/type_model.dart';
import 'package:http/http.dart' as http;

class TypeRepository {
  Future<List<TypeModel>> getAllTypes() async {
    try {
      final http.Response response =
          await http.get(Uri.parse("https://pokeapi.co/api/v2/type"));

      final List<dynamic> results =
          json.decode(response.body)['results'] as List;

      final List<TypeModel> types = List<TypeModel>.from(
        results.map((e) {
          return TypeModel.fromJson(e);
        }),
      );

      return types;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
