import 'package:flutter/material.dart';
import 'color.dart';

class Question extends StatelessWidget {
  String questionText;

  Question(this.questionText) {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child:Text(
      questionText,
      style: TextStyle(color: kShrineBrown900,fontFamily: 'PT Serif', fontSize: 30),
      textAlign: TextAlign.center,
    ));
  }
}
