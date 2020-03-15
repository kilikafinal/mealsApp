import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem(this.meal);

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName, arguments: meal);
  }

  String affordabilityText(Affordability affordability){
    switch(affordability){
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxury:
        return "Luxury";
      case Affordability.Pricey:
        return "Pricey";
      default:
        return "Unknown";
        break;
    }
  }


  String complexityText(Complexity complexity){
    switch(complexity){
      case Complexity.Simple:
        return "Simple";
      case Complexity.Hard:
        return "Hard";
      case Complexity.Challenging:
        return "Challenging";
      default:
        return "Unknown";
        break;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 350,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text(meal.duration.toString()),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(complexityText(meal.complexity)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(affordabilityText(meal.affordability)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
