import 'package:flutter/material.dart';
import 'package:pokemon_battle/app/theme/type_colors.dart';

class TypeModel {
  late final String name;
  late final String url;
  late final Color color;

  TypeModel({
    required this.name,
    required this.url,
    required this.color,
  });

  TypeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    color = typeColors[json['name']] ?? Colors.white;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "url": url,
      "color": color,
    };
  }
}
