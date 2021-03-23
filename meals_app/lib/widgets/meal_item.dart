import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability});

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unkown';
    }
  }

  Widget get affordabilityWidget {
    switch (affordability) {
      case Affordability.Affordable:
        return Icon(Icons.attach_money);
        break;
      case Affordability.Pricey:
        return Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
          Icon(Icons.attach_money),
          Icon(Icons.attach_money),
        ]);
        break;
      case Affordability.Luxurious:
        return Row(children: <Widget>[
          Icon(Icons.attach_money),
          Icon(Icons.attach_money),
        ]);
        break;
      default:
        return Row(children: <Widget>[

        ]);
    }
  }

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: selectMeal,
      child: Card(
        color: Colors.redAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(
                      width: 6,
                    ),
                    Text('${duration} min')
                  ]),
                  Row(children: <Widget>[
                    Icon(Icons.work),
                    SizedBox(
                      width: 6,
                    ),
                    Text('${complexityText}')
                  ]),
                  Row(children: <Widget>[
                    affordabilityWidget,
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
