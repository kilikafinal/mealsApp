import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories_meals_screen.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(225, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(fontSize: 24, fontFamily: "Raleway"),
            ),
      ),
      initialRoute: "/",
      routes: {
        "/": (ctx) => TabsScreen(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        CategoriesMealScreen.routeName: (ctx) => CategoriesMealScreen(),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
      },
      onGenerateRoute: (settings){
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
