
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
      width: 200,
      height: 40,
      margin: EdgeInsets.all(30),
      child: ElevatedButton(
        // color: kShrinePink300,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),

                  )
              ),
            backgroundColor: MaterialStateProperty.all(marvelRed)
          ),
        child: FittedBox(
          child: Text(answerText,style: TextStyle(
                color: marvelBlack,
                fontSize: 25,
                fontFamily: 'PT Serif',
                fontWeight: FontWeight.w400,
              )),
        ),
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
