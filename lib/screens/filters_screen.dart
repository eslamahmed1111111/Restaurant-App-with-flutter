import '../widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routName = "/filters";

  final Function saveFilters;
  final  Map <String, bool> currentFilters;
  const FilterScreen(this.currentFilters, this.saveFilters, );
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegan = false;
  bool _Vegetarian = false;

  @override
  void initState(){
     _GlutenFree = widget.currentFilters["gluten"];
     _LactoseFree = widget.currentFilters["lactose"];
     _Vegan = widget.currentFilters["vegan"];
     _Vegetarian =widget.currentFilters["vegetarian"];
    super.initState();
  }

  Widget buildSwitchListTile(
      String title, bool currentVal, Function updateVal) {
    return SwitchListTile(
      activeTrackColor:Colors.white60,
      inactiveTrackColor:Colors.white60,

      title: Text(
        title,
        style: Theme.of(context).textTheme.body1,
      ),
      value: currentVal,
      onChanged: updateVal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed:(){
            Map <String, bool> filters = {
              "gluten": _GlutenFree,
              "lactose": _LactoseFree,
              "vegan": _Vegan,
              "vegetarian": _Vegetarian,

            };
            widget.saveFilters(filters);
          })
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile("Gluten free", _GlutenFree, (newVal) {
                setState(() {
                  _GlutenFree = newVal;
                });
              }),

              buildSwitchListTile("Lactose free", _LactoseFree, (newVal) {
                setState(() {
                  _LactoseFree = newVal;
                });
              }),

              buildSwitchListTile("Vegan", _Vegan, (newVal) {
                setState(() {
                  _Vegan = newVal;
                });
              }),

              buildSwitchListTile("_Vegetarian", _Vegetarian, (newVal) {
                setState(() {
                  _Vegetarian = newVal;
                });
              }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
