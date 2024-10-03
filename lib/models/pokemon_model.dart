class Pokemon {
  final String name;
  final String imageUrl;
  final int pokedexNumber;
  final List<String> types;
  final double weight;
  final List<String> abilities;

  Pokemon({
    required this.name,
    required this.imageUrl,
    required this.pokedexNumber,
    required this.types,
    required this.weight,
    required this.abilities,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageUrl: json['sprites']['front_default'],
      pokedexNumber: json['id'],
      types: (json['types'] as List)
          .map((type) => type['type']['name'] as String)
          .toList(),
      weight: json['weight'].toDouble(),
      abilities: (json['abilities'] as List)
          .map((ability) => ability['ability']['name'] as String)
          .toList(),
    );
  }
}