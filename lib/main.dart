import "package:flutter/material.dart";
import 'quiz.dart';
import 'result.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore=0;

  void _restartQuiz(){
    setState(() {
      _questionIndex=0;
    _totalScore=0;
    });
    
  }
  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print("Answer Choosen ! ");
    } else {
      print("No more questions");
    }
  }

  @override
  final _questions = [
    {
      'questionText': "What is your name ? ",
      'answer': [
        {'text': 'Sumit', 'score': 10},
        {'text': 'Mohit', 'score': 5},
        {'text': 'Ujwal', 'score': 3},
        {'text': 'Shreyash', 'score': 1},
      ],
    },
    {
      'questionText': "Whats your favourite food ? ",
      'answer': [
        {'text': 'Biryani', 'score': 3},
        {'text': 'Pav Bhaji', 'score': 11},
        {'text': 'Roasted Chicken', 'score': 5},
        {'text': 'Dosa', 'score': 9},
      ],
    },
    {
      'questionText': "What is your Favourite Color ? ",
      'answer': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 6},
        {'text': 'Red', 'score': 2},
        {'text': 'Blue', 'score': 4},
      ],
    },
  ];

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("QUIZ APP"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_restartQuiz),
      ),
    );
  }
}
