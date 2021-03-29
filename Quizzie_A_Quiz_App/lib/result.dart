import 'package:flutter/material.dart';
import 'color.dart';

class Result extends StatelessWidget {
  final int resultScore;

  final Function resetHandler;
  Result(this.resultScore,this.resetHandler);

  String get resultPhrase {
    var resultText = "Your Score is " + resultScore.toString();

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(

          margin: EdgeInsets.all(30),
          child: Column(children: [
        Text(resultPhrase,
            style: TextStyle(
              color: kShrineBrown900,
              fontSize: 25,
              fontFamily: 'PT Serif',
              fontWeight: FontWeight.w400,
            )),
            RaisedButton(onPressed: resetHandler,color: kShrinePink300, child:Text("Restart Quiz",
                style: TextStyle(
                  color: kShrineBrown900,
                  fontSize: 25,
                  fontFamily: 'PT Serif',
                  fontWeight: FontWeight.w400,
                )) )
      ])),
    );
  }
}
