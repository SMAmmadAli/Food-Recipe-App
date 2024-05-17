import 'package:flutter/material.dart';
import 'package:food_recipes_app/controllers/recipe_controller.dart';
import 'package:food_recipes_app/utils/color_constant.dart';
import 'package:food_recipes_app/utils/text_constant.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final RecipeController recipeController = Get.put(RecipeController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [AppColor.grey, AppColor.greyblue]),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  margin: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          recipeController.fetchRecipes(
                              query: recipeController.recipeList.toString());
                        },
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(3.0, 0.0, 7.0, 0.0),
                          child: Icon(
                            Icons.search,
                            color: AppColor.blueAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: AppText.hintText,
                          ),
                          onSubmitted: (value) {
                            recipeController.fetchRecipes(query: value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.heading1,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                      Text(
                        AppText.subHeading,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColor.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Obx(() {
                    if (recipeController.isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (recipeController.recipeList.isEmpty) {
                      return Center(
                          child: Text(
                        AppText.noFound,
                        style: TextStyle(
                            fontSize: 18,
                            color: AppColor.white,
                            fontWeight: FontWeight.w600),
                      ));
                    } else {
                      return ListView.builder(
                        itemCount: recipeController.recipeList.length,
                        itemBuilder: (context, index) {
                          final recipe = recipeController.recipeList[index];
                          return InkWell(
                            onTap: () {},
                            child: Card(
                              elevation: 0.0,
                              margin: const EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      recipe.image ?? '',
                                      fit: BoxFit.cover,
                                      height: 200,
                                      width: double.infinity,
                                    ),
                                  ),
                                  Positioned(
                                    left: 0.0,
                                    bottom: 0.0,
                                    right: 0.0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                      ),
                                      decoration: const BoxDecoration(
                                          color: Colors.black26),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: Text(
                                          recipe.title ?? 'No title',
                                          style: TextStyle(
                                              color: AppColor.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
