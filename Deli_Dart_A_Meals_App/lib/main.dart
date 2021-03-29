import 'package:flutter/material.dart';
import './models/meal.dart';
import './data/dummy_data.dart';
import 'package:meals_app/screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/cateogry_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filter = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    print(filterData);
    setState(() {
      _filter = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filter['gluten'] && meal.isGlutenFree) {

          return true;
        }

        if (_filter['vegan'] && meal.isVegan) {
          return true;
        }

        if (_filter['vegetarian'] && meal.isVegetarian) {
          return true;
        }

        if (_filter['lactose'] && meal.isLactoseFree) {
          return true;
        }
        return false;
      }).toList();

    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favouriteMeals.indexWhere((meal)=> meal.id == mealId);
    if(existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }


  bool _isMealFavorite(String id) {
    return _favouriteMeals.any((meal) => meal.id == id);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.redAccent,
          canvasColor: Colors.black,
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                    color: Colors.white, fontSize: 18, fontFamily: 'Handlee'),
                bodyText2: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Handlee',
                ),
                headline6: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 20,
                  fontFamily: 'PlayfairDisplay',
                ),
                headline5: TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontSize: 20,
                  fontFamily: 'PlayfairDisplay',
                ),
                headline4: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'PlayfairDisplay',
                ),
                headline3: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 15,
                  fontFamily: 'PlayfairDisplay',
                ),
                headline2: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'PlayfairDisplay',
                ),
              )),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,_isMealFavorite),
        FilterScreen.routeName: (ctx) => FilterScreen(_filter,_setFilters),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
