import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  String title;
  double amount;

  CardWidget(this.title,this.amount) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,

      child: Card(
        color:  Colors.blueAccent,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child:
                  Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20)
                  ),
            ),
            Expanded(
              flex: 1,
              child:
              Text(
                  "\$"+amount.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20)
              ),
            ),
            Expanded(
              flex: 1,
              child: Icon(
                Icons.delete_outline,
                color: Colors.white,
                size: 25.0,
                semanticLabel: 'Delete Icon',
              ),
            )
          ],
        ),
      ),
    );
  }
}
