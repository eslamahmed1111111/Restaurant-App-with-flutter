import '../screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme.body2;

    Widget ListTileData(String title,IconData icon,Function tab){
      return  ListTile(
        leading: Icon(icon,color:Colors.white60 ,),
        title: Text(title,style: theme,),
        onTap: (){tab();},
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text("Cooking Up!",style: Theme.of(context).textTheme.body1),
          ),
          SizedBox(height: 20,),
          ListTileData("Meal", Icons.restaurant,()=>Navigator.of(context).pushReplacementNamed("/")),
          ListTileData("Filters", Icons.settings,()=>Navigator.of(context).pushNamed(FilterScreen.routName)),
        ],
      ),
    );
  }
}
