import 'package:flutter/material.dart';
import 'question.dart';

void main() {
  runApp(const Display());
}

class Display extends StatefulWidget {
  const Display({Key? key}) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  List<Icon> scorekeeper = [
    // const Icon(
    //   Icons.check,
    //   color: Colors.green,
    // ),
    // const Icon(
    //   Icons.close,
    //   color: Colors.red,
    // )
  ];
  // List<String> questions = [
  //   'Your name is Harsh.',
  //   'Your\'s ans. is false.',
  //   'Get new slide?'
  // ];
  // List<bool> answer = [true, false, true];
  //
  // Question q1=Question(q: 'Your name is Harsh.', a: true);
  // Question q2=Question(q: 'Your\'s ans. is false.', a: false);
  // Question q3=Question(q: 'Get new slide?', a: true);

  List<Question> questionBank = [
    Question(q: 'Your name is Harsh.', a: true),
    Question(q: 'Your\'s ans. is false.', a: false),
    Question(q: 'Get new slide?', a: true)
  ];

  int queNo = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 300, left: 20, right: 20),
                child: Wrap(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      // "This is where the question text will go. hi ja",
                      questionBank[queNo].questionText,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      onPressed: () {
                        setState(() {
                          // queNo += 1;
                          bool correctAnswer =
                              questionBank[queNo].questionAnswer;
                          if (correctAnswer == true) {
                            scorekeeper.add(
                              const Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            );
                          } else {
                            scorekeeper.add(
                              const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            );
                          }
                          if (queNo < 2) {
                            queNo++;
                          }
                        });
                      },
                      child: const Text(
                        "True",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(backgroundColor: Colors.red),
                      onPressed: () {
                        setState(() {
                          bool correctAnswer =
                              questionBank[queNo].questionAnswer;
                          if (correctAnswer == false) {
                            scorekeeper.add(
                              const Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                            );
                          } else {
                            scorekeeper.add(
                              const Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                            );
                          }
                          if (queNo < 2) {
                            queNo++;
                          }
                        });
                      },
                      child: const Text(
                        "False",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Row(children: scorekeeper)
            ],
          ),
        ),
      ),
    );
  }
}
