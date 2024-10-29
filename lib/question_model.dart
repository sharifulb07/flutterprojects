//create a question model here
//create a simple class now
class Question {
//   create question id because every question has an id
  final String id;

// every question has title as well as question itself
  final String title;

  final Map<String, bool> options;

// create a constructor here

  Question({required this.id, required this.title, required this.options});

// create a override function
  @override
  String toString() {
    return "Question (id: $id, title:$title options:$options ";
  }
}
