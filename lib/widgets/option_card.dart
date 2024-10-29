import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
   OptionCard({super.key, required this.option, required this.color, required this.onTap});

  String option;

  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        child: ListTile(
          title: Text(
            option,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,

            ),
          ),
        ),
      ),
    );
  }
}
