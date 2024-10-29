import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key, required this.nextQuestion});

  final VoidCallback nextQuestion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:nextQuestion ,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: neutral,
          borderRadius: BorderRadius.circular(10),

        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: const Text(
          "Next Question",
          textAlign: TextAlign.center,

        ),
      ),
    );
  }
}
