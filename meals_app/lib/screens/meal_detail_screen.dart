import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';


  MealDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("$mealId"),
        ),
        body: Center(child: Text("Meal Detail Screen $mealId")));
  }
}
