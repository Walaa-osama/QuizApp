import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'quiz.dart';
import 'reset.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  // ignore: unused_field
  int _score = 0;

  void nextQuestion(correct) {
    final correctPlayer = AudioPlayer();
    final wrongPlayer = AudioPlayer();

    const correctPath = 'sounds/correct.mp3';
    const wrongPath = 'sounds/wrong.mp3';

    if (correct == true) {
      _score++;
      correctPlayer.play(AssetSource(correctPath));
    } else {
      wrongPlayer.play(AssetSource(wrongPath));
    }
    setState(() {
      _index++;
    });
  }

  void restartQuiz() {
    setState(() {
      _index = 0;
      _score = 0;
    });
  }

  List<dynamic> data = [
    {
      'question': 'Who is the winner of World Cup 2022',
      'options': [
        {"option": 'Spain', "correct": false},
        {"option": 'France', "correct": false},
        {"option": 'Argentina', "correct": true},
        {"option": 'Brazil', "correct": false}
      ]
    },
    {
      'question': 'Who is the most followed person on Instagram',
      'options': [
        {"option": 'Cristiano', "correct": true},
        {"option": 'Messi', "correct": false},
        {"option": 'The Rock', "correct": false},
        {"option": 'Tom Cruise', "correct": false}
      ]
    },
    {
      'question': 'What does NASA stand for?',
      'options': [
        {
          "option": 'National Aeronautics and Space Administration',
          "correct": true
        },
        {"option": 'Nautical And Space Association', "correct": false},
        {
          "option": 'National Aeronautics and Space Association',
          "correct": false
        },
        {
          "option": 'New Aeronautics and Spacial Administration',
          "correct": false
        }
      ]
    },
    {
      'question': 'What was Daniel Craig’s first James Bond movie?',
      'options': [
        {"option": 'No time to Die', "correct": false},
        {"option": 'Casino Royale', "correct": true},
        {"option": 'Skyfall', "correct": false},
      ]
    },
    {
      'question': 'Egypt has 29 governments',
      'options': [
        {"option": 'True', "correct": true},
        {"option": 'False', "correct": false}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Quiz App'),
        ),
        body: _index < data.length
            ? Quiz(
                data: data,
                index: _index,
                nextQuestion: nextQuestion,
              )
            : Reset(reset: restartQuiz, score: _score, size: data.length));
  }
}

// if(_index == data.length-1)
//   Reset()
// else
//   Quiz()