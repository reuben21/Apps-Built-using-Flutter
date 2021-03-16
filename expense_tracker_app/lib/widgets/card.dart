import 'package:flutter/material.dart';
import '../COLORS.dart';
// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  String title;
  String amount;
  String date;

  CardWidget(this.title,this.amount,this.date);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color:colorMediumGreen,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child:
              Text(
                  amount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18
                  )
              ),
            ),
            Expanded(
              flex: 2,
              child:
              Container(

                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.title
                      ),
                      SizedBox(height: 10),
                      Text(date,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16)
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.delete_outline,

                  size: 25.0,
                  semanticLabel: 'Delete Icon',
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
