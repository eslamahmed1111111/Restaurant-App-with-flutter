import '../screens/meal_screen.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final Color color;
  final String title;

  const CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(MealScreen.routeName,
    arguments: {
      "id":id,
      "title":title,
    }
    );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () {selectCategory(context);},
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(8),
        child: Text(title, style: Theme.of(context).textTheme.title),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [color, color.withOpacity(0.7)]),
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
