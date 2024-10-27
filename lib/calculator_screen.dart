import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}


class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "0";
  String _currentInput = "";
  String _operator = "";
  double firstNumber = 0;



  void _buttonPressed(String buttonTxt) {

   setState(() {


    if (buttonTxt == "C") {
      String _output = "0";
      String _currentInput = "";
      String _operator = "";
      double firstNumber = 0;
    } else if (buttonTxt == "+" ||
        buttonTxt == "-" ||
        buttonTxt == "*" ||
        buttonTxt == "/") {
      firstNumber = double.parse(_output);
      _operator = buttonTxt;
      _currentInput = '';
    } else if (buttonTxt == "=") {
      double secondNumber = double.parse(_output);
      switch (_operator) {
        case "+":
          _output = (firstNumber + secondNumber).toString();
          break;
        case "-":
          _output = (firstNumber - secondNumber).toString();
          break;
        case "*":
          _output = (firstNumber * secondNumber).toString();
          break;
        case "/":
          _output = (firstNumber / secondNumber).toString();
          break;
      }
      _operator = '';
      _currentInput = _output;
    } else {
      _currentInput += buttonTxt;
      _output = _currentInput;
    }
   });
  }


  Widget _buildButton(String text) {
    return Expanded(
      child: OutlinedButton(
          onPressed:()=>_buttonPressed(text),
          child: Text(
            text,
            style: TextStyle(fontSize: 24),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator App"),
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(24),
            alignment: Alignment.bottomRight,
            child: Text(
              _output,
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          )),
          Column(
            children: [
              Row(
                children: [
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                  _buildButton("/"),
                ],
              ),Row(
                children: [
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                  _buildButton("-"),
                ],
              ),
              Row(
                children: [
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                  _buildButton("-"),
                ],
              ),
              Row(
                children: [
                  _buildButton("0"),
                  _buildButton("C"),
                  _buildButton("="),
                  _buildButton("+"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

