import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = "/category-meal";
  /*final String categoryId;
  final String categoryTitle;

  const CategoryMealScreen(this.categoryId, this.categoryTitle, {Key? key})
      : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    final routerArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routerArgs["title"];
    final categoryId = routerArgs["id"];
    // ignore: unused_local_variable
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(
          categoryId); //contains method and contains returns true if that list contains a specific value.
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
