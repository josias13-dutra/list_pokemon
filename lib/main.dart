import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/pokemon_list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokémon App',
      home: PokemonListView(),
    );
  }
}
