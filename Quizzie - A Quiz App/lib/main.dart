import 'package:flutter/material.dart';

const kShrinePink50 = Color(0xFFFEEAE6);
const kShrinePink100 = Color(0xFFFEDBD0);
const kShrinePink300 = Color(0xFFFBB8AC);
const kShrinePink400 = Color(0xFFEAA4A4);

const kShrineBrown900 = Color(0xFF442B2D);

const kShrineErrorRed = Color(0xFFC5032B);

const kShrineSurfaceWhite = Color(0xFFFFFBFA);
const kShrineBackgroundWhite = Colors.white;

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
          ),
          backgroundColor: kShrinePink300,
        ),
        backgroundColor: kShrinePink400,
        body: Column(
          children: <Widget>[
            Text(
              questions.elementAt(_questionIndex),
              style: TextStyle(color: kShrineBrown900, fontSize: 30),
            ),
            RaisedButton(
              child: Text(('Answer 1')),
              onPressed: answerQuestion,
            ),
            RaisedButton(
              child: Text(('Answer 2')),
              onPressed: () {
                print("Answer 2 Button Pressed");
              },
            ),
            RaisedButton(
              child: Text(('Answer 3')),
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
