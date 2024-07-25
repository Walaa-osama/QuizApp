import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer({
    super.key,
    required this.nextQuestion,
    required this.text,
  });
  final nextQuestion;
  final text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: nextQuestion,
        child: Text(text),
        // style: ElevatedButton.styleFrom(
        //     backgroundColor: Colors.blue, foregroundColor: Colors.black),
      ),
    );
  }
}
