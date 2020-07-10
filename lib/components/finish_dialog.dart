import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_dev/views/quiz_view.dart';
import 'package:share/share.dart';

class FinishDialog {
  static Future show(
    BuildContext context, {
    @required int hitNumber,
    @required int questionNumber,
  }) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade900,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: CircleAvatar(
              backgroundColor: Colors.green,
              maxRadius: 35.0,
              child: Icon(
                hitNumber < 6 ? Icons.warning : Icons.favorite,
                color: Colors.grey.shade900,
              ),
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Parabéns, Dev!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Você acertou $hitNumber de $questionNumber!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Que tal tentar mais uma vez? :)',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: const Text('COMPARTILHAR'),
                onPressed: () {
                  Share.share('devQUIZ. Você acertou $hitNumber de 10!! :D');
                },
              ),
              FlatButton(
                child: const Text('JOGAR NOVAMENTE'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuizView()));
                },
              ),
              FlatButton(
                child: const Text('SAIR'),
                onPressed: () {
                  SystemNavigator.pop();
                },
              ),
            ],
          );
        });
  }
}
