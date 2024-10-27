import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double bmiResult = 0.0;

  // calculate BMI

  void calculateBMI( double height,  double weight) {
    double bmi = weight / (height * height);

    setState(() {
      bmiResult = bmi;
    });
  }

  // clear BMI
  void clearBMI() {
    setState(() {
      bmiResult = 0.0;
      heightController.clear();
      weightController.clear();
    });
  }

  String determiceCategory( double bmiResult) {
    if (bmiResult < 1) {
      return '';
    } else if (bmiResult < 18.5) {
      return "UnderWeight";
    } else if (bmiResult < 24.9) {
      return "Normal Weight";
    } else if (bmiResult < 29.9) {
      return "OverWeight";
    } else if (bmiResult < 34.9) {
      return "Obesity Class I";
    } else if (bmiResult < 39.9) {
      return "Obesity Class II";
    } else {
      return "Obesity Class III";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        title: const Text("BMI Calculator App"),
      ),
      body: Center(
        child: Padding(

          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //   input field s and buttons add here
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Height (m)"
                ),
              ),
              SizedBox(height: 10,),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Weight (kg)"
                ),
              ),

              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    if (heightController.text.isNotEmpty &&
                        weightController.text.isNotEmpty) {
                      calculateBMI( double.parse(heightController.text),
                           double.parse(weightController.text));
                    }
                  }, child: const Text("Calculate")),

              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    clearBMI();
                  }, child: const Text("Clear")),
              SizedBox(height: 20,),
              bmiResult>0.0?
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)

                    ),
                    child: Column(
                      children: [
                        Text("BMI Result: "),
                        SizedBox(height: 10,),
                        Text(bmiResult.toStringAsFixed(2),
                        style: TextStyle(fontSize: 35),
                        )
                      ],
                    ),
                  ):SizedBox.shrink(),

SizedBox(height: 10,),
              Text(determiceCategory(bmiResult)),

            ]
          ),
        ),
      ),
    );
  }
}
