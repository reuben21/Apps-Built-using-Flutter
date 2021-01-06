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
  var _totalScore = 0;
  // var _answerQuestion = 0;
  final _questions = const [
    {
      'questionText': "What's your Favourite Color?",
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 7},
        {'text': 'Green', 'score': 8},
        {'text': 'Yellow', 'score': 5}
      ]
    },
    {
      'questionText': "What's your Favourite Animal?",
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 7},
        {'text': 'Lion', 'score': 8},
        {'text': 'Rufus', 'score': 5}
      ]
    },
    {
      'questionText': "What's your Favourite Phone?",
      'answers': [
        {'text': 'S10', 'score': 10},
        {'text': 'S9', 'score': 7},
        {'text': 'S8', 'score': 8},
        {'text': 'S6', 'score': 5}
      ]
    },
  ];

  void _restQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

  }
  void _answerQuestion(int score) {
    _totalScore += score;
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
            : Result(_totalScore,_restQuiz),
      ),
    );
  }
}
