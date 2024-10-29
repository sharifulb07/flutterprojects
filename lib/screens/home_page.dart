import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/question_model.dart';
import 'package:quiz_app/widgets/next_button.dart';
import 'package:quiz_app/widgets/option_card.dart';
import 'package:quiz_app/widgets/questions_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Question> _questions = [
    Question(
        id: "10",
        title: "What is 2+3 ?",
        options: {'4': false, "5": true, "6": false, "7": false}),
    Question(
        id: "30",
        title: "What is 45+10 ?",
        options: {'40': false, "50": false, "55": true, "7": false}),
    Question(
        id: "40",
        title: "What is 20+3 ?",
        options: {'14': false, "52": false, "6": false, "23": true}),
  ];

  int index = 0;
  bool isPressed = false;
  int score = 0;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      return;
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
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

  void changeColor() {
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                question: _questions[index].title,
                indexAction: index,
                totalQuestions: _questions.length),
            const Divider(
              color: neutral,
            ),
            const SizedBox(
              height: 10,
            ),
            for (int i = 0; i < _questions[index].options.length; i++)
              OptionCard(
                option: _questions[index].options.keys.toList()[i],
                color: isPressed
                    ? _questions[index].options.values.toList()[i] == true
                        ? correct
                        : incorrect
                    : neutral,
                onTap: changeColor,
              )
          ],
        ),
      ),
      floatingActionButton: NextButton(
        nextQuestion: nextQuestion,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
