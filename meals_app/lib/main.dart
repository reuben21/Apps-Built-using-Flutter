import 'package:flutter/material.dart';
import './cateogry_meals_screen.dart';
import './categories_screen.dart';

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
        fontFamily: 'Handlee',
        canvasColor: Colors.black,
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(color:Colors.white,fontSize: 18),
          bodyText2: TextStyle(color:Colors.white),
          headline6: TextStyle(color:Colors.redAccent,fontSize: 20),

        )

      ),
      home: CategoriesScreen(),
      routes: {
        CategoryMealsScreen.routeName:(ctx) => CategoryMealsScreen()
      },
    );
  }
}
