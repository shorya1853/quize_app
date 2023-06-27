import 'package:flutter/material.dart';
import 'package:fundamental_flutter/data.dart';
import 'package:fundamental_flutter/summary_page.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key, required this.reset_page, required this.resultlist});

  final void Function() reset_page;
  final List<String> resultlist;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < resultlist.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'answers': questions[i].answer[0],
          'user_chosen': resultlist[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final getsummarydata = getSummaryData();
    final total_question = questions.length;
    final correct_answer = getsummarydata.where((data) {
      return data['answers'] == data['user_chosen'];
    }).length;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'Out of $total_question questions, $correct_answer questions are correctly answered!', style: const TextStyle(fontSize:17)),
          const SizedBox(
            height: 30,
          ),
          SummaryPage(data: getsummarydata),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: reset_page,
            icon: const Icon(Icons.refresh),
            label: const Text(
              'Reset',
              style: TextStyle(fontSize: 17),
            ),
          )
        ],
      ),
    );
  }
}
