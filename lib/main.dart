import 'package:flutter/material.dart';
import 'package:budgettracker/home.dart'; // Import the home.dart file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BudgetTrackerHomePage(), // Use BudgetTrackerHomePage from home.dart
    );
  }
}
