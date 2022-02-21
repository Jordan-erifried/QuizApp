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
          child: QuizPage(),
        ),
      ),
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

  List<String> questions = [
    'You can lead a cow down stairs out not stairs',
    'Approximately one quarter of human bones are title feet',
    'It slug\'s blood is green'
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
         flex: 4,
         child: Padding(
           padding: const EdgeInsets.all(10.0),
           child: Center(
             child: Text(
               questions[questionNumber],
               style: TextStyle(
                 color: Colors.white,
                 fontSize: 20.0,
               ),
               textAlign: TextAlign.center,
             ),
           ),
         ),
       ),

        Expanded(
           child: Padding(
             padding: EdgeInsets.all(10.0),
             child: FlatButton(
               onPressed: () {

                 bool correctAnswer = answers[questionNumber];

                 if (correctAnswer == true) {
                   print('user got it right !');
                 } else {
                   print('user got it wrong !');
                 }

                 setState(() {
                 questionNumber++;
                 print(questionNumber);
               });
               },
               color: Colors.green,
               child: Text(
                 'True',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 20.0,
                   fontWeight: FontWeight.bold,
                 ),
               ),
             ),
           ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              onPressed: () {

                bool correctAnswer =answers[questionNumber];

                if (correctAnswer == false) {
                  print('user got it right');
                } else {
                  print('user got it wrong');
                }

                setState(() {
                 questionNumber++;
                });

                print(questionNumber);
              },
              color: Colors.red,
              child: Text(
                  'False',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
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

