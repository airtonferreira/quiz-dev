import 'package:projeto_quiz/components/centered_circular_progress.dart';
import 'package:projeto_quiz/components/centered_message.dart';
import 'package:projeto_quiz/components/finish_dialog.dart';
import 'package:projeto_quiz/components/result_dialog.dart';
import 'package:projeto_quiz/controllers/quiz_controller.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class QuizView extends StatefulWidget {
  @override
  _QuizViewState createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  final _controller = QuizController();
  List<Widget> _scoreKeeper = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await _controller.initialize();

    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: Text('devQUIZ ( ${_scoreKeeper.length}/${_controller.questionNumber} )'),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: _buildQuiz(),
      ),
      ),
    );
  }

  _buildQuiz() {
    if(_loading) return CenteredCircularProgress();

    if(_controller.questionNumber == 0) {
      return CenteredMessage('Não há perguntas',
      icon: Icons.warning,
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _buildQuestion(_controller.getQuestion()),
        _buildAnswerButton(_controller.getAnswer1()),
        _buildAnswerButton(_controller.getAnswer2()),
        _buildScoreKeeper(),
      ],
    );
  }

  _buildQuestion(String question) {
    return Expanded(flex: 5, child: Padding(padding: EdgeInsets.symmetric(vertical: 16.0),
    child: Center(
      child: Text(question, textAlign: TextAlign.center, style: TextStyle(
        fontSize: 25.0,
        color: Colors.white,
      ),
      ),
    ),
    ),
    );
  }

  _buildAnswerButton(String answer) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(4.0),
            color: Colors.blue,
            child: Center(
              child: AutoSizeText(
                answer,
                maxLines: 2,
                minFontSize: 10.0,
                maxFontSize: 32.0,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          onTap: () {
            bool correct = _controller.correctAnswer(answer);

            ResultDialog.show(
              context,
              question: _controller.question,
              correct: correct,
              onNext: () {
                setState(() {
                  _scoreKeeper.add(
                    Icon(
                      correct ? Icons.check : Icons.close,
                      color: correct ? Colors.green : Colors.red,
                    ),
                  );

                  if (_scoreKeeper.length < _controller.questionNumber) {
                    _controller.nextQuestion();
                  } else {
                    FinishDialog.show(
                      context,
                      hitNumber: _controller.hitNumber,
                      questionNumber:  _controller.questionNumber
                    );
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }

  _buildScoreKeeper() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _scoreKeeper,
      ),
    );
  }

}
