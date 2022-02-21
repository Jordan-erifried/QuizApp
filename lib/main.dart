import 'package:flutter/material.dart';

void main() {
  runApp(Quizzler());
}

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      )
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Widget> scoreKeeper = [];

  List<String> question = [
    'You can lead a cow down stairs out not up stairs.',
    'Approximately one quarter of human bones are in the feet',
    'It slug\'s blood is green',
  ];

  List<bool> answers = [
    false,
    true,
    true,
  ];
  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
               question[questionNumber],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                bool correcteAnswer = answers[questionNumber];

                if (correcteAnswer == true) {
                  print('user got it right!');
                } else {
                  print('user got it wrong');
                }

                setState(() {
                  questionNumber++;
                });
               print(questionNumber);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                )
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {
                bool correctAnswer = answers[questionNumber];

                if (correctAnswer == false) {
                  print('user got it right!');
                } else {
                  print('user got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
                print(questionNumber);
              },
              child: Text(
                  'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),

        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

