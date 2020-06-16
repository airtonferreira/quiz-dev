import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String resTxt;
  final void Function() onSelected;

  Response(this.resTxt, this.onSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.indigo,
        onPressed: onSelected,
        child: Text(
          resTxt,
          style: TextStyle(
            fontFamily: 'Monaco',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
