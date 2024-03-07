import 'package:flutter/material.dart';
import 'pokemon_list_page.dart';
import 'api_service.dart';
import 'pokemon.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PokemonListPageWrapper(),
    );
  }
}

class PokemonListPageWrapper extends StatelessWidget {
  const PokemonListPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: ApiService.fetchPokemons(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PokemonListPage(pokemons: snapshot.data!);
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
