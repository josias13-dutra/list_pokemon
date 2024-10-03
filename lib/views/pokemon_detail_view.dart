import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';

class PokemonDetailView extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetailView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(pokemon.imageUrl),
            SizedBox(height: 16),
            Text('Pokedex Number: ${pokemon.pokedexNumber}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Weight: ${pokemon.weight} kg', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Types: ${pokemon.types.join(', ')}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Abilities: ${pokemon.abilities.join(', ')}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
