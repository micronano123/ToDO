import 'package:flutter/material.dart';
import 'personality_test_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dream Path'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                    ),
                );
              },
              icon: Icon(Icons.person),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PersonalityTestScreen()),
              );
            },
            child: Text('Start Personality Test'),
        ),
      ),
    );
  }
}