import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoriesMealScreen extends StatefulWidget {
  static const routeName = "/categoriesMeals";

  @override
  _CategoriesMealScreenState createState() => _CategoriesMealScreenState();
}

class _CategoriesMealScreenState extends State<CategoriesMealScreen> {
  String title;
  String id;
  List<Meal> categoryMeals;
  bool _loadedInitData = false;

  @override
  void initState() {

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(_loadedInitData ==false) {
      final routeArgs =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, String>;
      title = routeArgs["title"];
      id = routeArgs["id"];
      categoryMeals = DUMMY_MEALS
          .where((element) => element.categories.contains(id))
          .toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String id) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(categoryMeals[index],_removeMeal);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
