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
      width: 250,
      height: 50,
      margin: EdgeInsets.all(30),
      child: ElevatedButton(
        // color: kShrinePink300,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),

                  )
              ),
            backgroundColor: MaterialStateProperty.all(kShrinePink300)
          ),
        child: Text(answerText,style: TextStyle(
              color: kShrineBrown900,
              fontSize: 25,
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
