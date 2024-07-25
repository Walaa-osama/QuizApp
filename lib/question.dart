import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  const Question({super.key, this.text});
  final text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    );
  }
}
