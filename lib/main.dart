import 'package:flutter/material.dart';
import 'package:projeto_quiz/result.dart';
import './quiz.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _selectedQuestion = 0;

  bool get haveSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  void _response() {
    setState(() {
      _selectedQuestion++;
    });
  }

  final _questions = const [
    {
      'question': 'Qual propriedade CSS centraliza um elemento?',
      'responses': ['Align Items', 'Text Align', 'Justify Content'],
    },
    {
      'question': 'Qual tag HTML tem propriedades de mídia?',
      'responses': ['div', 'video', 'iframe'],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Quiz DEV')),
          body: haveSelectedQuestion
              ? Quiz(
                  questions: _questions,
                  selectedQuestion: _selectedQuestion,
                  response: _response,
                )
              : Result()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
