import 'package:flutter/material.dart';
import 'color.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  // var _answerQuestion = 0;
  final _questions = const [
    {
      'questionText': "What's your Favourite Color?",
      'answers': ['Black', 'Red', 'Green', 'Yellow']
    },
    {
      'questionText': "What's your Favourite Animal?",
      'answers': ['Dog', 'Cat', 'Lion', 'Rufus']
    },
    {
      'questionText': "What's your Favourite Phone?",
      'answers': ['S10', 'S9', 'S8', 'S6']
    },
  ];

  void _answerQuestion() {
    if (_questionIndex < _questions.length) {
      print("We Have More Questions");
    }

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quizzie",
              style: TextStyle(
                color: kShrineBrown900,
                fontSize: 30,
                fontFamily: 'PT Serif',
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center),
          backgroundColor: kShrinePink300,
        ),
        backgroundColor: kShrinePink400,
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(),
      ),
    );
  }
}
