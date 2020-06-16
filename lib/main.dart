import 'package:flutter/material.dart';
import 'package:projeto_quiz/response.dart';
import './question.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _selectedQuestion = 0;

  void _response() {
    setState(() {
      _selectedQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questions = [
      {
        'question': 'Qual propriedade CSS centraliza um elemento?',
        'responses': ['Align Items', 'Text Align', 'Justify Content'],
      },
      {
        'question': 'Qual tag HTML tem propriedades de mídia?',
        'responses': ['div', 'video', 'iframe'],
      }
    ];

    List<String> responses = questions[_selectedQuestion]['responses'];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Quiz DEV')),
          body: Column(
            children: <Widget>[
              Question(questions[_selectedQuestion]['question']),
              ...responses.map((txt) => Response(txt, _response)).toList(),
            ],
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
