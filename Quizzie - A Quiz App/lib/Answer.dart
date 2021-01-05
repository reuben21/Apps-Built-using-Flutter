import 'package:flutter/material.dart';
import 'color.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectHandler;

  Answer(this.selectHandler,this.answerText) {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(30),
      child: RaisedButton(
        color: kShrineBrown900,

        child: Text(answerText,style: TextStyle(
              color: kShrinePink50,
              fontSize: 20,
              fontFamily: 'PT Serif',
              fontWeight: FontWeight.w400,
            )),
        onPressed: selectHandler,
      ),

    );
    //   answerText,
    //     style: TextStyle(
    //       color: kShrineBrown900,
    //       fontSize: 20,
    //       fontFamily: 'PT Serif',
    //       fontWeight: FontWeight.w400,
    //     )
    // );
  }
}
