import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import './QuizBrains.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
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
  QuizBrains quiz = QuizBrains();

  void checkCurrentQuestionAnswer(bool givenAnswer) {
    bool correct = this.quiz.answerCurrentQuestion(givenAnswer);
    Icon icon = correct
        ? Icon(
            Icons.check,
            color: Colors.green,
          )
        : Icon(
            Icons.close,
            color: Colors.red,
          );

    setState(() {
      this.answerIcons.add(icon);
      if (this.quiz.isFinished()) {
        showFinishedAlert();
        this.answerIcons = [];
        this.quiz.reset();
      }
    });
  }

  void showFinishedAlert() {
    Alert(
      context: context,
      title: "Finished",
      desc: "You have finished the quiz!",
    ).show();
  }

  List<Icon> answerIcons = [];

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
                this.quiz.getCurrentQuestionText(),
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
                checkCurrentQuestionAnswer(true);
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
                checkCurrentQuestionAnswer(false);
              },
            ),
          ),
        ),
        Center(
          child: Row(
            children: answerIcons,
          ),
        )
      ],
    );
  }
}
