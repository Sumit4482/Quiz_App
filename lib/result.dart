import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText = 'You did it !';
    if (resultScore <= 8) {
      resultText = "You are Awesome !";
    } else if (resultScore <= 16) {
      resultText = "You are Bad !!";
    } else {
      resultText = "You are extreme bad !!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text(
        resultPhrase,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      FlatButton(
        onPressed: resetHandler,
        child: const Text(
          "RESTART QUIZ",
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ),
    ]));
  }
}
