import 'package:flutter/material.dart';

class Reset extends StatelessWidget {
  const Reset(
      {super.key,
      required this.reset,
      required this.score,
      required this.size});

  final reset;
  final score;
  final size;
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your score is $score / $size',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: reset,
            child: Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
