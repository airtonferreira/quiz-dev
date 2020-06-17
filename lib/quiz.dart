import 'package:flutter/material.dart';
import './response.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function() response;

  Quiz({
    @required this.response,
    @required this.selectedQuestion,
    @required this.questions,
  });

  bool get haveSelectedQuestion {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<String> responses =
        haveSelectedQuestion ? questions[selectedQuestion]['responses'] : null;

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]['question']),
        ...responses.map((txt) => Response(txt, response)).toList(),
      ],
    );
  }
}
