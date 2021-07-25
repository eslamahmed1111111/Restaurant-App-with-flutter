import 'package:app10/module/meal.dart';

import '../widgets/main_drawer.dart';

import 'categories_screens.dart';
import 'favourite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeal;
  TabsScreen(this.favouriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


   List<Map<String, Object>> pages;
   @override
  void initState(){
    pages=[
      {
        "page":CategoriesScreen(),
        "title":"Categories"
      },
      {
        "page":FavouriteScreen(widget.favouriteMeal),
        "title":"Favourites"
      }
    ];
  }
  int selectedPageIndex=0;
  void selectPage (int value){
    setState(() {
      selectedPageIndex=value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(pages[selectedPageIndex]["title"]),
        ),
        body: pages[selectedPageIndex]["page"],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor:Theme.of(context).accentColor ,
          unselectedItemColor: Colors.white,
          currentIndex: selectedPageIndex,
          items: [BottomNavigationBarItem(
              icon: Icon(Icons.category),
          label:"Categories"
          ),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label:"Favourites"
            ),
          ],
        ),
    drawer: MainDrawer(),

    );
  }
}
