import '../module/meal.dart';

import '../widgets/meal_item.dart';
import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealScreen extends StatefulWidget {
  static const String routeName = "category_meals";
  List<Meal> availableMeal;
  MealScreen(this.availableMeal);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {

  String title;
  List <Meal> categoryMeals;

  void removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute
        .of(context)
        .settings
        .arguments as Map<String, String>;
    final id = routeArg["id"];
    title = routeArg["title"];
    categoryMeals = widget.availableMeal.where((meal) {
      return meal.categories.contains(id);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              imageUrl: categoryMeals[index].imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
