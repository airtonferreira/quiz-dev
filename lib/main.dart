import 'package:flutter/material.dart';

main() => runApp(QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _selectedRes = 0;

  void _response() {
    setState(() {
      _selectedRes++;
    });
    print(_selectedRes);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> questions = [
      'Qual propriedade CSS centraliza um elemento?',
      'Qual tag HTML tem propriedades de mídia?'
    ];

    justifyRes() {
      bool res() {
        return true;
      }

      if (res() == true) {
        _response();
        return print('Acertou mizeravi!');
      } else {
        print('Vc ERROU!');
      }
    }

    alignItems() {
      bool res() {
        return false;
      }

      if (res() == true) {
        return print('Acertou mizeravi!');
      } else {
        print('Vc ERROU!');
      }
    }

    textAlignRes() {
      bool res() {
        return false;
      }

      if (res() == true) {
        return print('Acertou mizeravi!');
      } else {
        print('Vc ERROU!');
      }
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('Quiz DEV')),
          body: Column(
            children: <Widget>[
              Text(questions[_selectedRes]),
              RaisedButton(
                onPressed: () => alignItems(),
                child: Text('Align Items'),
              ),
              RaisedButton(
                onPressed: () => textAlignRes(),
                child: Text('Text Align'),
              ),
              RaisedButton(
                onPressed: () => justifyRes(),
                child: Text('Justify Content'),
              ),
            ],
          )),
    );
  }
}

class QuizApp extends StatefulWidget {
  _QuizAppState createState() {
    return _QuizAppState();
  }
}
