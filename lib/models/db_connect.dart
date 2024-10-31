import 'package:http/http.dart' as http;
import 'question_model.dart';
import 'dart:convert';

class DBConnect {
  final url = Uri.parse(
      'https://simplequizapp-809f2-default-rtdb.firebaseio.com/questions.json');

  Future<void> addQuestion(Question question) async {
    http.post(url,
        body: json.encode({
          "title": question.title,
          "options": question.options,
        }));
  }

//   feetching data from database

  Future<List<Question>> fetchQuestions() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newquestion = Question(
            id: key,
            title: value['title'],
            options: Map.castFrom(value['options']));
        newQuestions.add(newquestion);
      });

      return newQuestions;
    });
  }
}
