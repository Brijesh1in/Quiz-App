import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'quizEndedPage.dart';

QuizBrain quizBrain = new QuizBrain();
void main() => runApp(Quizzler());

//class Quizzler extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        backgroundColor: Colors.grey.shade900,
//        body: SafeArea(
//          child: Padding(
//            padding: EdgeInsets.symmetric(horizontal: 10.0),
//            child: QuizPage(),
//          ),
//        ),
//      ),
//    );
//  }
//}
//

class Quizzler extends StatelessWidget {
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
          body: Container(
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  
  Widget newIcon(bool ok){
    
    if(ok)
      return Icon(
        
        Icons.check ,
        color : Colors.green ,
      );
    return Icon(
      
      Icons.clear ,
      color : Colors.red ,
    );
  }
  
  void checkQuizEnded(){
    if(quizBrain.isLast())
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizEnded(quizBrain)));
  }
  List<Widget> scores = [];
  int counter = 0;
  List<bool> ansKey = [false , true , true];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  bool isCorrect = quizBrain.getQuestionAns() == true;
                  scores.add(newIcon(isCorrect));
                  quizBrain.manageScore(isCorrect);
                });
                checkQuizEnded();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
  
                setState(() {
                  scores.add(newIcon(quizBrain.getQuestionAns()==false));
                });
                quizBrain.manageScore(quizBrain.getQuestionAns()==false);
                checkQuizEnded();
              },
            ),
          ),
        ),
        Row(
          children: scores ,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
