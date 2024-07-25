import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  const Quiz(
      {super.key,
      required this.data,
      required this.index,
      required this.nextQuestion});

  final data;
  final index;
  final nextQuestion;
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Question(
        text: data[index]['question'],
      ),
      ...data[index]['options'].map((m) {
        return Answer(
          text: m['option'],
          nextQuestion: () {
            nextQuestion(m['correct']);
          },
        );
      }).toList(),
    ]);
  }
}
