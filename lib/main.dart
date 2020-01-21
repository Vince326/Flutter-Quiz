import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  

  final _questions = const [
    {
      'questionText': "What\'s your favorite color?",
      'answers': [
        {'text': 'Black', 'score': 8},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ],
    },
    {
      'questionText': "What\'s your favortie animal?",
      'answers': [
        {'text': 'Lion', 'score': 8},
        {'text': 'Shark', 'score': 10},
        {'text': 'Dog', 'score': 3},
        {'text': 'Zebra', 'score': 4}
      ],
    },
    {
      'questionText': "What\'s your birth month",
      'answers': [
        {'text': 'May', 'score': 2},
        {'text': 'March', 'score': 5},
        {'text': 'October', 'score': 6},
        {'text': 'January', 'score': 1},
      ],
    },
    {
      'questionText': "Who\'s your favorite instructor?",
      'answers': [
        {'text':'Colt Steele', 'score': 8},
        {'text':'Academind', 'score': 5},
        {'text':'London App Brewery', 'score': 3},
        {'text':'Jonny B & Caleb','score': 4}
      ],
    },
  ];
  
  int _questionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
    _totalScore = 0;
    });
    
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    if (_questionIndex < _questions.length) {
      print("We Have more questions!");
    } else {
      print("We're all out of Questions!");
    }
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: (_questionIndex < _questions.length)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
