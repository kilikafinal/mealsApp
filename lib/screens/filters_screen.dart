import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  buildListTile(
      String title, String subtitle, bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(subtitle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust meal selection"),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                buildListTile(
                    "Gluten Free", "Only Include Gluten Free", _glutenFree,
                    (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildListTile(
                    "Vegetarian", "Only Include Vegetarian", _vegetarian,
                        (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                buildListTile(
                    "Vegan", "Only Include Vegan", _vegan,
                        (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
                buildListTile(
                    "Lactose Free", "Only Include Lactose Free", _lactoseFree,
                        (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
