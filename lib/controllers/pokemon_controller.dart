import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/pokemon_model.dart';

class PokemonController extends GetxController {
  var pokemonList = <Pokemon>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPokemonList();
    super.onInit();
  }

  Future<void> fetchPokemonList() async {
    isLoading(true);
    try {
      final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20'));
      if (response.statusCode == 200) {
        List<dynamic> results = jsonDecode(response.body)['results'];
        var pokemons = await Future.wait(results.map((pokemon) => fetchPokemonDetails(pokemon['url'])));
        pokemonList.assignAll(pokemons);
      }
    } catch (e) {
      print("Erro ao buscar lista de Pokémon: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<Pokemon> fetchPokemonDetails(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return Pokemon.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Falha ao carregar Detalhes do Pokemon");
    }
  }
}
