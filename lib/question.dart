import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String txt;

  Question(this.txt);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        txt,
        style: TextStyle(
          fontFamily: 'Monaco',
          fontSize: 28,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
