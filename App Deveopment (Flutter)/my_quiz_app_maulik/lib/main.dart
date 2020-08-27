import 'package:flutter/material.dart';
import 'quizz_brain.dart';

QuizzBrain quizzBrain = QuizzBrain();

void main() {
  runApp(QuizzApp());
}

class QuizzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff84C9DE),
        body: SafeArea(
          child: QuizzPage(),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  int userScoreCorrect = 0;
  int userScoreWrong = 0;

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizzBrain.getCorrectAnswer();

    setState(() {
      if (quizzBrain.isFinished() == true) {
        quizzBrain.reset();
        userScoreCorrect = 0;
        userScoreWrong = 0;
      } else {
        if (userPickedAnswer == correctAnswer) {
          userScoreCorrect++;
        } else {
          userScoreWrong++;
        }
        quizzBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/brain.png',
            height: 250.0,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    quizzBrain.getQuestionText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        print('Check button');
                        checkAnswer(true);
                      },
                      iconSize: 50.0,
                      icon: Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      '$userScoreCorrect',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        print('close button');
                        checkAnswer(false);
                      },
                      iconSize: 50.0,
                      icon: Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      '$userScoreWrong',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
