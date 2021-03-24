import 'package:flutter/material.dart';
import './screens/meal_detail_screen.dart';
import 'screens/cateogry_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.blueAccent,

        canvasColor: Colors.black,
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color:Colors.white,fontSize: 18,fontFamily: 'Handlee'),
          bodyText2: TextStyle(color:Colors.white,fontFamily: 'Handlee',),
          headline6: TextStyle(color:Colors.redAccent,fontSize: 20,fontFamily: 'PlayfairDisplay',),

        )

      ),
      home: CategoriesScreen(),
      routes: {
        CategoryMealsScreen.routeName:(ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName:(ctx) => MealDetailScreen(),
      },
    );
  }
}