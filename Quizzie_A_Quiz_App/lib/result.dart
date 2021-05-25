import 'package:flutter/material.dart';
import 'color.dart';

class Result extends StatelessWidget {
  final double resultScore;

  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = "You Scored " + resultScore.toString() + "%";

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [

            SizedBox(height: 70),
            Text(resultPhrase,
                style: TextStyle(
                  color: marvelRed,
                  fontSize: 25,
                  fontFamily: 'PT Serif',
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(height: 30),
            FittedBox(
              child: Text(resultScore >= 80 ? "You are a hardcore Marvel Fan" : "You Need To Watch Marvel Movies Again",
                  style: TextStyle(
                    color: marvelRed,
                    fontSize: 20,
                    fontFamily: 'PT Serif',
                    fontWeight: FontWeight.w400,
                  )),
            ),
            SizedBox(height: 50),
            RaisedButton(
                onPressed: resetHandler,
                color: marvelRed,
                child: Text("Restart Quiz",
                    style: TextStyle(
                      color: marvelBlack,
                      fontSize: 25,
                      fontFamily: 'PT Serif',
                      fontWeight: FontWeight.w400,
                    )))
          ])),
    );
  }
}
