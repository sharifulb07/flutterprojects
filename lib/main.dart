import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_page.dart';
void main(){
  runApp(App());

}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: HomePage(),
    );
  }
}
