import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';
QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Quizzler'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
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

  List<Icon> scoreKeeper = [];

  void checkAnswer (bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {

      if (quizBrain.isFinished() == true) { // newly added from flutter alert package.
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'Congrat\'s. You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      }
      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(Icons.check, color: Colors.green,));
        } else {
          scoreKeeper.add(Icon(Icons.close, color: Colors.red,));
        }

        quizBrain.nextQuestion();
      }
      });
    }

    //    Icon(
//      Icons.check,
//      color: Colors.green,
//  ),
//    Icon(
//      Icons.close,
//      color: Colors.red,
//    ),
//    Icon(
//      Icons.check,
//      color: Colors.green,
//    ),
//    Icon(
//      Icons.close,
//      color: Colors.red,
//    ),
//    Icon(
//      Icons.check,
//      color: Colors.green,
//    ),
//    Icon(
//      Icons.close,
//      color: Colors.red,
//    ),


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
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(

            textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'TRUE',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
              //quizBrain.questionBank[questionNumber].questionAnswers = true;
              checkAnswer(true);


              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(

              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'FALSE',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
               checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
          ],
        );
  }
}