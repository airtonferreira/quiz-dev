import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'PARABÉNS!!!',
        style: TextStyle(
            fontSize: 32,
            fontFamily: 'Monaco',
            color: Colors.green,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
