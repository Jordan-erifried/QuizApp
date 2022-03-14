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
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> questions = [
    "You can lean a cow down stairs but not up stairs.",
    "Approximately one quarter of human bones are in the feet.",
    "A slug\'s blood is green.",
    "My fav language it's Flutter"
  ];

  List<Widget> scoreKeeper = [];

  List<bool> answers = [false, true, true];

  int questionNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
                child: Text(
                    questions[questionNumber],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                )
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              onPressed: () {
                bool correctAnswer = answers[questionNumber];

                if(correctAnswer == true) {
                  print("User got it right !");
                } else {
                  print("User got it wrong !");
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
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              onPressed: () {

                bool correctAnswer = answers[questionNumber];

                if(correctAnswer == false) {
                  print("User got it wrong!");
                } else {
                  print("User got it right!");
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
                  fontWeight: FontWeight.bold,
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

