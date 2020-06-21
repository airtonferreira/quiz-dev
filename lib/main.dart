import 'package:flutter/material.dart';
import 'package:projeto_quiz/result.dart';
import './quiz.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quizDEV',
      home: QuizView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
