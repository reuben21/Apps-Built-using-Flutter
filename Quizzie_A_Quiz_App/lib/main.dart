import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
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
  var _quizStart = false;

  // var _answerQuestion = 0;
  final _questions = const [
    {
      'questionText': "What's Howard Stark's Butler's Name? ",
      'answers': [
        {'text': 'EDWIN JARVIS', 'score': 10},
        {'text': 'JARVIS', 'score': 0},
        {'text': 'J.A.R.V.I.S.', 'score': 0},
        {'text': 'H.O.M.E.R.', 'score': 0}
      ]
    },
    {
      'questionText':
          "IRON MAN: What song plays at the beginning of the movie?",
      'answers': [
        {'text': '"Iron Man" by Black Sabbath', 'score': 0},
        {'text': ' "Ordinary World" by Duran Duran', 'score': 0},
        {'text': '\"Back In Black\" by AC/DC', 'score': 10},
        {'text': '"Stairway to Heaven" by Led Zeppelin', 'score': 0}
      ]
    },
    {
      'questionText':
          "SPIDER-MAN: FAR FROM HOME: What necklace does Peter buy for M.J.?",
      'answers': [
        {'text': 'A Black Sunflower Necklace', 'score': 0},
        {'text': 'A Black Dahlia Necklace', 'score': 10},
        {'text': 'A Saint Christopher Necklace', 'score': 0},
        {'text': 'A Blue Dahlia Necklace', 'score': 0}
      ]
    },
    {
      'questionText':
          "AVENGERS: ENDGAME: What is Natasha's final line before she sacrifices herself on Vormir?",
      'answers': [
        {'text': 'Let me go', 'score': 0},
        {'text': 'It\'s Okay', 'score': 10},
        {'text': 'Clint', 'score': 0},
        {'text': 'Tell Everyone I ___', 'score': 0}
      ]
    },
    {
      'questionText': "CAPTAIN MARVEL: What is Carol's nickname for Monica?",
      'answers': [
        {'text': 'Sergeant Danger', 'score': 0},
        {'text': 'Commander Monica', 'score': 0},
        {'text': 'Lieutenant Trouble', 'score': 10},
        {'text': 'General Mo', 'score': 0}
      ]
    },
  ];

  void _restQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
      _quizStart = false;
    });
  }

  void startQuiz() {}

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: marvelBlack,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz",
              style: TextStyle(
                color: marvelRed,
                fontSize: 30,
                fontFamily: 'PT Serif',
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center),
          backgroundColor: marvelBlack,
        ),
        backgroundColor: marvelBlack,
        body: _quizStart
            ? _questionIndex < _questions.length
                ? SingleChildScrollView(
                    child: Quiz(
                        questions: _questions,
                        answerQuestion: _answerQuestion,
                        questionIndex: _questionIndex),
                  )
                : Result(
                    (_totalScore / (_questions.length * 10) * 100), _restQuiz)
            : SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 100),
                      Lottie.asset('assets/question.json',
                          width: 200, height: 200, fit: BoxFit.fill),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _quizStart = true;
                            });
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: marvelRed,
                                boxShadow: [
                                  BoxShadow(color: marvelRed.withOpacity(0.8), spreadRadius: 3),
                                ],
                              ),
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(10),

                              child: Text(
                                'Start Quiz',
                                style: TextStyle(
                                    color: marvelBlack,
                                    fontSize: 20,
                                    fontFamily: 'PT Serif',
                                    backgroundColor: marvelRed),
                              )))
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
