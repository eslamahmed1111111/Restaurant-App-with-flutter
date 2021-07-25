import '../screens/meal_detail.dart';

import '../module/meal.dart';
import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String imageUrl;

  const MealItem(
      {@required this.title,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.imageUrl,
      @required this.id,
     });



  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          MealDetail.routeName,
          arguments: id,
        );

  }

  String get complexityText {
    switch (complexity) {
      case (Complexity.Simple):
        return "Simple";
        break;
      case (Complexity.Challenging):
        return "Challenging";
        break;
      case (Complexity.Hard):
        return "Hard";
        break;
      default:
        return "UnKnown";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case (Affordability.Affordable):
        return "Affordable";
        break;
      case (Affordability.Luxurious):
        return "Luxurious";
        break;
      case (Affordability.Pricey):
        return "Pricey";
        break;
      default:
        return "UnKnown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    color: Colors.black54,
                    width: 300,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        Text(" $duration min",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        Text(" $complexityText",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.attach_money),
                        Text(" $affordabilityText",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))
                      ],
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
