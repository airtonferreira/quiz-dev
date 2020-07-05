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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text(
              'devQUIZ ( ${_scoreKeeper.length}/${_controller.questionNumber} )'),
          centerTitle: true,
          elevation: 0.0,
        ),
        backgroundColor: Color.fromRGBO(27, 29, 32, 1),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 600,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage('assets/background.png'),
                //     fit: BoxFit.fill,
                //   ),
                // ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        child: Container(
                      child: Center(
                        child: _buildQuiz(),
                      ),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _buildQuiz() {
    if (_loading) return CenteredCircularProgress();

    if (_controller.questionNumber == 0) {
      return CenteredMessage(
        'Não há perguntas',
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
    return Expanded(
      flex: 2,
      child: Card(
        color: Color.fromRGBO(40, 42, 45, 1),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: 15,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                question,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildAnswerButton(String answer) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            padding: const EdgeInsets.only(),
            elevation: 15,
            textColor: Colors.white,
            color: Color.fromRGBO(155, 48, 249, 1),
            child: Container(
              padding: EdgeInsets.all(0),
              child: Center(
                child: AutoSizeText(
                  answer,
                  maxLines: 4,
                  minFontSize: 10.0,
                  maxFontSize: 32.0,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            onPressed: () {
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
                      FinishDialog.show(context,
                          hitNumber: _controller.hitNumber,
                          questionNumber: _controller.questionNumber);
                    }
                  });
                },
              );
            },
          ),
        ],
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
