import 'package:flutter/material.dart';
import 'package:fundamental_flutter/data.dart';
import 'package:fundamental_flutter/quize_page.dart';
import 'package:fundamental_flutter/result_page.dart';

import 'home_page.dart';

class MpageWid extends StatefulWidget {
  const MpageWid({super.key});
  @override
  State<MpageWid> createState() {
    return _MpageWidState();
  }
}

class _MpageWidState extends State<MpageWid> {
  List<String> selectedanswer = [];
  var current_Widget = 'home_page';

  void switchwidget() {
    setState(() {
      current_Widget = 'quize_page';
    });
  }

  void addanswerilist(String subans) {
    selectedanswer.add(subans);

    if(selectedanswer.length == questions.length){
      setState(() {
      current_Widget = 'result_page';
      });
    }
  }
  void reset_page(){
    setState(() {
      selectedanswer = [];
      current_Widget = 'home_page';
    });
  }

  @override
  Widget build(context) {
    Widget widget_page = HomePage(switchwidget);

    if(current_Widget == 'quize_page'){
      widget_page = QuizePage(addanswer: addanswerilist);
    }
    if (current_Widget == 'result_page'){
      widget_page = ResultPage(reset_page: reset_page, resultlist: selectedanswer,);
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Color.fromARGB(255, 9, 144, 255),
            ],
          ),
        ),
        child: widget_page
      ),
    );
  }
}
