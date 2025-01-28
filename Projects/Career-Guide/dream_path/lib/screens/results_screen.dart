import 'package:flutter/material.dart';
import 'career_details_screen.dart';

class ResultsScreen extends StatelessWidget {
  final String hollandCode;

  ResultsScreen({required this.hollandCode});

  final Map<String, List<String>> _careerSuggestions = {
    "RIA": ["Mechanical Engineer", "Architect"],
    "AES": ["Graphic Designer", "Event Planner"],
    "SEC": ["Teacher", "Counselor"],
    "RIS": ["Doctor", "Pharmacist"],
    "EIC": ["Entrepreneur", "Financial Analyst"],
    // Add more mappings here
  };

  @override
  Widget build(BuildContext context) {
    List<String> careers = _careerSuggestions[hollandCode] ?? ["No careers found"];

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Holland Code: $hollandCode"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Suggested Careers:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: careers.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(careers[index]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                CareerDetailsScreen(career: careers[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}