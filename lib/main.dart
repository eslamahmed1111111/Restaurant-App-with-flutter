import './dummy_data.dart';
import './module/meal.dart';

import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail.dart';
import './screens/meal_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Map <String,bool> filters={
    "gluten":false,
    "lactose":false,
    "vegan":false,
    "vegetarian":false,

  };

  List<Meal> availableMeal=DUMMY_MEALS;
  List<Meal> favouriteMeal=[];

  void setFilters (Map <String,bool> filterData){
    setState(() {
      filters=filterData;
      availableMeal=DUMMY_MEALS.where((element) {
        if(filters["gluten"] && !element.isGlutenFree)
          return false;
        if(filters["lactose"] && !element.isLactoseFree)
          return false;
        if(filters["vegan"] && !element.isVegan)
          return false;
        if(filters["vegetarian"] && !element.isVegetarian)
          return false;
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId){
    final existingIndex=favouriteMeal.indexWhere((element) => element.id==mealId);
    if(existingIndex>=0){
      setState(() {
        favouriteMeal.removeAt(existingIndex);
      });
    }
    else{
      setState(() {
        favouriteMeal.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
      });
    }
  }

  bool isMealFavourite(String id){
    return favouriteMeal.any((element) => element.id==id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.deepPurple,
        canvasColor: Colors.black,
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
              fontSize: 21,
              // color: Colors.white,
              fontFamily:"RobotoCondensed",
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
          body2: TextStyle(
              fontSize: 24,
              // color: Colors.white,
              fontFamily:"RobotoCondensed",
              fontWeight: FontWeight.bold,
              color: Colors.pink          ),
          title: TextStyle(
            fontSize: 21,
            // color: Colors.white,
            fontFamily:"RobotoCondensed",
              fontWeight: FontWeight.bold
          ),
        )
      ),
      // home: MyHomePage(title: 'Meal App'),
      routes: {
        '/':(context)=>TabsScreen(favouriteMeal),
        MealScreen.routeName:(context)=>MealScreen(availableMeal),
        MealDetail.routeName:(context)=>MealDetail(toggleFavourite,isMealFavourite),
        FilterScreen.routName:(context)=>FilterScreen(filters,setFilters),

      },

    );

  }
}


