class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final String type;
  final String height;
  final String weight;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
    required this.height,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['pokedex_id'],
      name: json['name']['fr'],
      imageUrl: json['sprites']['regular'],
      type: json['types'][0]['name'],
      height: json['height'],
      weight: json['weight'],
    );
  }
}
