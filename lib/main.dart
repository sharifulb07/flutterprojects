import 'package:flutter/material.dart';

import 'home_screen.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BMI Calculator",
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: HomeScreen(),
    );
  }
}
