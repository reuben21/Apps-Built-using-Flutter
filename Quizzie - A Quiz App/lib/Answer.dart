import 'package:flutter/material.dart';
import 'color.dart';

class Answer extends StatelessWidget {
  String answerText;

  Answer(this.answerText) {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text(
      answerText,
        style: TextStyle(
          color: kShrineBrown900,
          fontSize: 20,
          fontFamily: 'PT Serif',
          fontWeight: FontWeight.w400,
        )
    );
  }
}
