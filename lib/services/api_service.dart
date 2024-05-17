import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:food_recipes_app/models/recipe_model.dart';

class ApiService {
  static const String apiKey = "64415618236d43589d70e6c3c260a17d";
  static const String baseUrl =
      "https://api.spoonacular.com/recipes/complexSearch";

  Future<ApiModels?> fetchRecipes(
      {String query = "chicken", String cuisine = "american"}) async {
    final Uri url =
        Uri.parse('$baseUrl?apiKey=$apiKey&query=$query&cuisine=$cuisine');
    final http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return ApiModels.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load recipes');
    }
  }
}
