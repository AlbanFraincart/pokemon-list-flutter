import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemon.dart';

class ApiService {
  static Future<List<Pokemon>> fetchPokemons() async {
    final response =
        await http.get(Uri.parse('https://tyradex.vercel.app/api/v1/gen/1'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Pokemon.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pokemons');
    }
  }
}
