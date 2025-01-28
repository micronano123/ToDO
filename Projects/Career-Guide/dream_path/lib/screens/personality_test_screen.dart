import 'package:flutter/material.dart';
import 'results_screen.dart';

class PersonalityTestScreen extends StatefulWidget{
  @override
  _PersonalityTestScreenState createState() => _PersonalityTestScreenState();
}

class _PersonalityTestScreenState extends State<PersonalityTestScreen>{
  int _currentQuestionIndex = 0;
  Map<String, int> _scores = {
    "R": 0,
    "I": 0,
    "A": 0,
    "S": 0,
    "E": 0,
    "C": 0,
  };

  final List<Map<String,dynamic>> _questions = [
    {
      "question": "What do you enjoy doing in your free time?",
      "options":[
        {"text":"Fixing things", "type": "R"},
        {"text":"Reading scientific articles", "type": "I"},
        {"text": "Painting or drawing", "type": "A"},
        {"text": "Volunteering", "type": "S"},
        {"text": "Organizing events", "type": "E"},
        {"text": "Managing finances", "type": "C"},
      ],
    },
    {
      "question": "What type of work environment do you prefer?",
      "options": [
        {"text": "Outdoors or hands-on", "type": "R"},
        {"text": "Labs or research facilities", "type": "I"},
        {"text": "Creative studios", "type": "A"},
        {"text": "Schools or community centers", "type": "S"},
        {"text": "Corporate offices", "type": "E"},
        {"text": "Structured and organized spaces", "type": "C"},
      ],
    },
    // Add more questions here or move the rest to the db
  ];

  void _answerQuestion(String type){
    setState(() {
      _scores[type] = _scores[type]! + 1;
      _currentQuestionIndex++;
    });

    //If all questions are answered, navigate to the results screen.
    if(_currentQuestionIndex >= _questions.length){
      String hollandCode = _calculateHollandCode();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultsScreen(hollandCode: hollandCode),
          ),
      );
    }
  }

  String _calculateHollandCode() {
    // Sort scores to determine the top 3 personality types
    var sortedEntries = _scores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    String code = sortedEntries.sublist(0, 3).map((e) => e.key).join();
    return code;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Personality Test"),
    ),
    body: _currentQuestionIndex < _questions.length
    ? Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    _questions[_currentQuestionIndex]["question"],
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
      SizedBox(height: 20),
      ...(_questions[_currentQuestionIndex]["options"]
      as List<dynamic>)
          .map((option) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ElevatedButton(
          onPressed: () => _answerQuestion(option["type"]),
          child: Text(option["text"]),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
          ),
        ),
      ))
          .toList(),
    ],
    ),
    )
        : Center(
      child: CircularProgressIndicator(),
    ),
    );
  }












}