import 'package:flutter/material.dart';

class CareerDetailsScreen extends StatelessWidget {
  final String career;

  CareerDetailsScreen({required this.career});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(career),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Details about the career...'),
            SizedBox(height: 20),
            Text(
              'Required Skills',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('List of required skills...'),
            SizedBox(height: 20),
            Text(
              'Salary Range',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Average salary range...'),
          ],
        ),
      ),
    );
  }
}