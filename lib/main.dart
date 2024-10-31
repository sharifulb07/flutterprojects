import 'package:flutter/material.dart';
import 'package:quiz_app/screens/home_page.dart';
import './models/question_model.dart';
import './models/db_connect.dart';

void main(){

  runApp(const App());
  var db=DBConnect();
  // db.addQuestion(
  //     Question(id: "101", title: "What is 20*200 ?", options: {
  //       '100':false,
  //       '200':false,
  //       '4000':true,
  //       '500':false,
  //     })
  // );
  db.fetchQuestions();


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
