import 'package:first_app/result.dart';
import 'package:flutter/material.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quiz App",
          ),
          centerTitle: true,
        ),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 11},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Mohammed', 'score': 1},
        {'text': 'Lobna', 'score': 1},
        {'text': 'Waseem', 'score': 1},
        {'text': 'Ahmed', 'score': 1},
        {'text': 'Abdo', 'score': 1},
        {'text': 'Sogod', 'score': 1},
      ],
    },
  ];

  void answerQuestion(int score) {
    _totalScore += score;
    print("Answer chosen !" + _totalScore.toString());
    setState(() {
      _questionIndex++;
    });
    // if (_questionIndex < _questions.length) {
    //   print('we have more questions');
    // }

    // print(_questionIndex);
    // print(_questions.length);
  }

  void _restartquiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Center(
        child: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                questionIndex: _questionIndex,
                answerQuestion: answerQuestion)
            : Result(_totalScore, _restartquiz),
      ),
    );
  }
}
