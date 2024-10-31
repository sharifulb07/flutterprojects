import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/widgets/next_button.dart';
import 'package:quiz_app/widgets/option_card.dart';
import 'package:quiz_app/widgets/questions_widget.dart';

import '../widgets/result_box.dart';
import '../models/db_connect.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var db = DBConnect();

  // List<Question> extractdata = [
  //   Question(
  //       id: "10",
  //       title: "What is 2+3 ?",
  //       options: {'4': false, "5": true, "6": false, "7": false}),
  //   Question(
  //       id: "30",
  //       title: "What is 45+10 ?",
  //       options: {'40': false, "50": false, "55": true, "7": false}),
  //   Question(
  //       id: "40",
  //       title: "What is 20+3 ?",
  //       options: {'14': false, "52": false, "6": false, "23": true}),
  // ];

  late Future extractdata;

  Future<List<Question>> getData() async {
    return db.fetchQuestions();
  }

  @override
  void initState() {
    extractdata = getData();
    super.initState();
  }

  int index = 0;
  bool isPressed = false;
  int score = 0;
  bool alreadySelect = false;

  void nextQuestion(int questionlength) {
    if (index == questionlength - 1) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: questionlength,
                onPressed: startOver,
              ));
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          alreadySelect = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please select one option"),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.symmetric(vertical: 20),
        ));
      }
    }
  }

  void changeColorAndUpdateScore(bool value) {
    if (alreadySelect) {
      return;
    } else {
      if (value == true) {
        score++;
      }
      setState(() {
        isPressed = true;
        alreadySelect = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      alreadySelect = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: extractdata as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractdata = snapshot.data as List<Question>;
            return Scaffold(
              backgroundColor: background,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: AppBar(
                  title: const Text(
                    'Quiz App',
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  actions: [
                    Padding(
                      padding: EdgeInsets.all(18),
                      child: Text(
                        'Score: ${score}',
                        style: TextStyle(color: neutral, fontSize: 18),
                      ),
                    ),
                  ],
                  centerTitle: false,
                  backgroundColor: background,
                  shadowColor: Colors.transparent,
                ),
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    QuestionsWidget(
                        question: extractdata[index].title,
                        indexAction: index,
                        totalQuestions: extractdata.length),
                    const Divider(
                      color: neutral,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    for (int i = 0; i < extractdata[index].options.length; i++)
                      GestureDetector(
                        onTap: () => changeColorAndUpdateScore(
                            extractdata[index].options.values.toList()[i]),
                        child: OptionCard(
                          option: extractdata[index].options.keys.toList()[i],
                          color: isPressed
                              ? extractdata[index].options.values.toList()[i] ==
                                      true
                                  ? correct
                                  : incorrect
                              : neutral,
                        ),
                      )
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractdata.length),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: NextButton(),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please wait while questions are loading.....",
                  style: TextStyle(
                    fontSize: 14,
                    color: neutral,
                    decoration: TextDecoration.none,
                  ),
                )
              ],
            ),
          );
        }
        return const Center(
          child: Text('No Data'),
        );
      },
    );
  }
}
