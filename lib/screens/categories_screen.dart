import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = "/categoriesScreen";

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        children: DUMMY_CATEGORIES
            .map((e) => CategoryItem(
                  id: e.id,
                  title: e.title,
                  color: e.color,
                ))
            .toList(),
      );
  }
}
