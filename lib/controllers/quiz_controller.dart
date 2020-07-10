import 'dart:math';
import 'package:quiz_dev/models/question.dart';
import 'package:quiz_dev/services/quiz_service.dart';

class QuizController {
  List<Question> _questionDb = [];

  Random _random = new Random();
  int questionIndex = 0;
  bool _shiftAnswer;
  int hitNumber = 0;

  int get questionNumber => _questionDb.length ?? 0;
  Question get question => _questionDb[questionIndex];

  Future<void> initialize() async {
    questionIndex = 0;
    hitNumber = 0;
    _questionDb = await QuizService.fetch();
    // print('Number of questions: ${_questionDb.length}');
    _questionDb.shuffle();
    _shiftAnswer = _random.nextBool();
  }

  void nextQuestion() {
    questionIndex = ++questionIndex % _questionDb.length;
    _shiftAnswer = _random.nextBool();
  }

  String getQuestion() {
    return _questionDb[questionIndex].question;
  }

  String getAnswer1() {
    return _shiftAnswer
        ? _questionDb[questionIndex].answer1
        : _questionDb[questionIndex].answer2;
  }

  String getAnswer2() {
    return _shiftAnswer
        ? _questionDb[questionIndex].answer2
        : _questionDb[questionIndex].answer1;
  }

  bool correctAnswer(String answer) {
    var correct = _questionDb[questionIndex].answer1 == answer;
    hitNumber = hitNumber + (correct ? 1 : 0);
    return correct;
  }
}
