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

  bool get haveSelectedQuestion {
    return _selectedQuestion < _questions.length;
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
    List<String> responses = haveSelectedQuestion
        ? _questions[_selectedQuestion]['responses']
        : null;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Quiz DEV')),
          body: haveSelectedQuestion
              ? Column(
                  children: <Widget>[
                    Question(_questions[_selectedQuestion]['question']),
                    ...responses
                        .map((txt) => Response(txt, _response))
                        .toList(),
                  ],
                )
              : Center(
                  child: Text(
                    'PARABÉNS!!!',
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Monaco',
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
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
