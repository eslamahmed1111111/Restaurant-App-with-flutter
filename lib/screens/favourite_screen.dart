import 'package:app10/widgets/meal_item.dart';

import '../module/meal.dart';
import 'package:flutter/material.dart';
class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeal;
  FavouriteScreen(this.favouriteMeal);

  @override
  Widget build(BuildContext context) {

    if(favouriteMeal.isEmpty){
      return Center(
        child: Text("You have no Favourites yet",style: Theme.of(context).textTheme.bodyText1,),
      );
    }
    else{
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favouriteMeal[index].id,
              title: favouriteMeal[index].title,
              duration: favouriteMeal[index].duration,
              complexity: favouriteMeal[index].complexity,
              affordability: favouriteMeal[index].affordability,
              imageUrl: favouriteMeal[index].imageUrl,
              // removeItem:removeMeal
          );
        },
        itemCount: favouriteMeal.length,


      );
    }

  }
}
