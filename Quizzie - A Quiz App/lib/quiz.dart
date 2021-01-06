import 'package:flutter/material.dart';
import 'question.dart';
import 'Answer.dart';

class Quiz extends StatelessWidget {

  final List<Map<String, Object>> questions;

  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {@required this.questions, @required this.answerQuestion, @required this.questionIndex,});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: [
          Question(
            questions[questionIndex]['questionText'],
          ),
          ...(questions[questionIndex]['answers'] as List<Map<String,Object>>).map((
              answer) {
            return Answer(()=>answerQuestion(answer['score']), answer['text']);
          }).toList()

        ]
    );
  }

}