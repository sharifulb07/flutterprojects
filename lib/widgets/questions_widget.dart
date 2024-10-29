import 'package:flutter/material.dart';

class QuestionsWidget extends StatelessWidget {
  const QuestionsWidget(
      {super.key,
      required this.question,
      required this.indexAction,
      required this.totalQuestions});

  final String question;
  final int indexAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Questions ${indexAction + 1}/$totalQuestions : $question',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
