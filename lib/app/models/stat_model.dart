class StatModel {
  late final String name;
  late final String url;
  late final int baseStat;

  StatModel.fromJson(Map<String, dynamic> json){
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
}