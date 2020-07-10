import 'package:flutter/material.dart';
import 'package:quiz_dev/views/quiz_view.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'quizDEV',
      theme: ThemeData(fontFamily: 'IBMPlexMono'),
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
