import 'package:app10/dummy_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  static const String routeName = "meal_detail";
  final Function toggleFavourite;
  final Function isMealFavourite;

  MealDetail(this.toggleFavourite,this.isMealFavourite);

  Widget bodyContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white12,
            border: Border.all(color: Colors.white60),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        height: 180,
        width: 300,
        child: child);
  }

  Widget titleCard(BuildContext context, String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white60,
      ),
      width: 250,
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            titleCard(context, "Ingredients"),
            bodyContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            titleCard(context, "Steps"),
            bodyContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text("# ${index+1}"),
                        ),
                        title: Text(selectedMeal.steps[index],style: TextStyle(color: Colors.white),),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=>toggleFavourite(mealId),
        child: Icon(isMealFavourite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
