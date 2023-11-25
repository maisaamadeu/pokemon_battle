import 'package:equatable/equatable.dart';

class StatModel extends Equatable {
  late final String name;
  late final String url;
  late final int baseStat;

  StatModel.fromJson(Map<String, dynamic> json) {
    name = json['stat']['name'];
    url = json['stat']['url'];
    baseStat = json['base_stat'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'base_stat': baseStat,
    };
  }

  @override
  List<Object?> get props => [
        name,
        url,
        baseStat,
      ];
}
