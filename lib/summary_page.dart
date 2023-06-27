import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key, required this.data});

  final List<Map<String, Object>> data;

  @override
  Widget build(context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(103, 0, 111, 202),
            Color.fromARGB(155, 33, 149, 243),
          ],
        ),
      ),
      child: SizedBox(
        width: 400,
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: data.map((info) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: info['user_chosen'] == info['answers']
                              ? Colors.cyan
                              : Colors.indigo,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                          ((info['question_index'] as int) + 1).toString())),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          info['question'].toString(),
                          style: const TextStyle(
                            fontSize: 19,
                          ),
                        ),
                        Text(
                          info['user_chosen'].toString(),
                          style: TextStyle(
                              fontSize: 15,
                              color: info['user_chosen'] == info['answers']
                                  ? Color.fromARGB(255, 27, 20, 231)
                                  : Color.fromARGB(255, 133, 0, 185)),
                        ),
                        Text(info['answers'].toString(),
                            style: const TextStyle(color: Colors.white)),
                      ],
                    ),
                  )
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
