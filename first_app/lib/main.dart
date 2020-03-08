import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'question': 'What\'s your favourite color',
      'options': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'question': 'What\'s your favourite animal',
      'options': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 8},
        {'text': 'Lion', 'score': 12}
      ]
    },
    {
      'question': 'What\'s your favourite bird',
      'options': [
        {'text': 'Woodpecker', 'score': 5},
        {'text': 'Peacock', 'score': 8},
        {'text': 'Koel', 'score': 7},
        {'text': 'Humming Bird', 'score': 2}
      ]
    },
  ];
  void _answerQuestions(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }
  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My first App'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  answerQuestions: _answerQuestions,
                  questionIndex: _questionIndex,
                )
              : Result(_totalScore,_resetQuiz)),
    );
  }
}
