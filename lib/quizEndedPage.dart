import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain;
class QuizEnded extends StatefulWidget {
  QuizEnded(QuizBrain data){
    
    quizBrain = data;
  }
  @override
  _QuizEndedState createState() => _QuizEndedState();
}

class _QuizEndedState extends State<QuizEnded> {
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            title: Text(
              'Quiz App',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'The quiz has ended\nYour score is ' + (quizBrain.getUserScore()).toString() + '/' + quizBrain.getTotalScore().toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
