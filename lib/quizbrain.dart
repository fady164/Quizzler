import 'package:flutter/material.dart';
import 'question.dart';



class QuizBrain{
  int _quesnum = 0;
  List<Question> _quesBank=[
    Question( questions:'Are you from Eygpt?',questionAnswer:true),
    Question(questions:'Is the dog in the garden?',questionAnswer:true),
  ];

  void nextQues(){
    if(_quesnum<_quesBank.length-1)
      _quesnum++;
  }


  String getQues(){
    return _quesBank[_quesnum].questions;
  }
  bool getAns(){
    return _quesBank[_quesnum].questionAnswer;
  }
}
