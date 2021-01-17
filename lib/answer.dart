import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectHandeler;
  Answer(this.answerText, this.selectHandeler);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.all(20),
      child: RaisedButton(
        onPressed: selectHandeler,
        color: Colors.blue,
        textColor: Colors.white,
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
