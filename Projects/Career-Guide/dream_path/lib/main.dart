import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state_management/user_provider.dart';
import 'screens/home_screen.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dream Path',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(), // Ensure this points to the correct initial screen
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}