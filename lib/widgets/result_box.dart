import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox(
      {super.key,
      required this.result,
      required this.questionLength,
      required this.onPressed});

  final int result;
  final int questionLength;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(70),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Result : ",
              style: TextStyle(color: neutral, fontSize: 28),
            ),
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
                child: Text(
                  "$result/$questionLength",
                  style: TextStyle(fontSize: 35),
                ),
                radius: 60,
                backgroundColor: result == questionLength / 2
                    ? Colors.yellow
                    : result < questionLength / 2
                        ? incorrect
                        : correct),
            const SizedBox(
              height: 20,
            ),
            Text(
              result == questionLength / 2
                  ? "Almost there"
                  : result < questionLength / 2
                      ? "Try Again"
                      : "Great!",
              style: const TextStyle(color: neutral),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: onPressed,
              child: Text(
                "Start Over! ",
                style: const TextStyle(
                    color: Colors.blue, letterSpacing: 1, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
