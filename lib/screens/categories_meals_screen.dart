import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoriesMealScreen extends StatelessWidget {
  static const routeName = "/categoriesMeals";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs["title"];
    final id = routeArgs["id"];
    final categoryMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(id))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index]);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
