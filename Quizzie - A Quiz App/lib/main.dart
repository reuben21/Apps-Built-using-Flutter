import 'package:flutter/material.dart';
import 'package:flutter_app/Answer.dart';
import 'question.dart';
import 'color.dart';


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

  void answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var questions = [
      "What's your Favourite Color?",
      "What's your Favourite Animal?"
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quizzie",
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
        body: Column(
          children: <Widget>[
            Question(
              questions.elementAt(_questionIndex),
            ),
            RaisedButton(
              child: Answer('Red'),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Answer('Yellow'),
              onPressed: () {
                print("Answer 2 Button Pressed");
              },
            ),
            RaisedButton(
              child: Answer('Green'),
              onPressed: () {
                print("Answer 3 Button Pressed");
              },
            )
          ],
        ),
      ),
    );
  }
}
