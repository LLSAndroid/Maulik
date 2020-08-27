import 'package:flutter/cupertino.dart';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text(
            'Dicee Dice',
            style: TextStyle(
              color: Colors.blueGrey[100],
              fontSize: 20.0,
            ),
          ),
          backgroundColor: Colors.blueGrey[700],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int topDiceNumber = 1;
  int bottomDiceNumber = 1;
  int totalScore;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              child: Text(
                'Score: $totalScore',
                style: TextStyle(
                    fontFamily: 'PTMono',
                    fontSize: 25,
                    color: Colors.blueGrey[100]),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(80, 50, 80, 30),
              child: Image.asset(
                'images/dice$topDiceNumber.png',
                color: Colors.white38,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(80, 0, 80, 80),
              child: Image.asset(
                'images/dice$bottomDiceNumber.png',
                color: Colors.white38,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
            child: FlatButton(
              onPressed: () {
                setState(() {
                  bottomDiceNumber = Random().nextInt(6) + 1;
                  topDiceNumber = Random().nextInt(6) + 1;
                  totalScore = topDiceNumber + bottomDiceNumber;
                });
              },
              child: Image.asset('images/btn.png'),
            ),
          ),
        ],
      ),
    );
  }
}
