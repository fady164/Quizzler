import 'package:flutter/material.dart';

import 'quizbrain.dart';

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(Quizler());
}

class Quizler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff333333),
        body: SafeArea(child: Quizpage()),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Icon> scorekeep = [];

  void checkAns(bool userAns) {
    bool correctans = quizBrain.getAns();
    if (correctans == userAns) {
      print('User answered correct');
      setState(() {
        quizBrain.nextQues();
        scorekeep.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      });
    } else {
      print('User answer wrong');
      setState(() {
        quizBrain.nextQues();
        scorekeep.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQues(),
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
              padding: const EdgeInsets.all(11.0),
              child: FlatButton(
                color: Colors.green[400],
                textColor: Colors.white,
                child: Text('True'),
                onPressed: () {
                  checkAns(true);
                },
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: FlatButton(
                child: Text('False'),
                color: Colors.red[400],
                textColor: Colors.white,
                onPressed: () {
                  checkAns(false);
                }),
          )),
          Row(
            children: scorekeep,
          )
        ]);
  }
}
