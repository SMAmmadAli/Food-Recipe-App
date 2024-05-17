import 'package:get/get.dart';
import 'package:food_recipes_app/models/recipe_model.dart';
import 'package:food_recipes_app/services/api_service.dart';

class RecipeController extends GetxController {
  var isLoading = true.obs;
  var recipeList = <Results>[].obs;

  @override
  void onInit() {
    fetchRecipes();
    super.onInit();
  }

  void fetchRecipes({String query = "chicken"}) async {
    try {
      isLoading(true);
      var recipes = await ApiService().fetchRecipes(query: query);
      if (recipes != null) {
        recipeList.assignAll(recipes.results!);
      } else {
        recipeList.clear();
      }
    } finally {
      isLoading(false);
    }
  }
}
