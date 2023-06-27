import 'package:flutter/material.dart';
import 'package:fundamental_flutter/button_text.dart';
import 'package:fundamental_flutter/model/question_model.dart';

import 'data.dart';

class QuizePage extends StatefulWidget {
  const QuizePage({super.key, required this.addanswer});
  final void Function(String subans) addanswer;
  @override
  State<QuizePage> createState() {
    return _QuizePageState();
  }
}
class _QuizePageState extends State<QuizePage> {
  var questionIndex = 0;

  void answeredquestion(String subans){
    widget.addanswer(subans);
    setState(() {
      // questionIndex = questionIndex +  1;
      // questionIndex += 1;
      questionIndex ++;
    });
  }

  @override
  Widget build(context) {
    final answerdata = questions[questionIndex];

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(answerdata.question, 
              style: const TextStyle(color: Colors.white,
              fontSize: 18), 
              textAlign: TextAlign.center),
              const SizedBox(height: 40,),
              ...answerdata.answershuffel().map((answer) {
                return ButtonText(onTap: (){
                  answeredquestion(answer);
                }, answer: answer);
              })
            ],),
      ),
    );
  }
}
