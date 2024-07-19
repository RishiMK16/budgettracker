import 'package:flutter/material.dart';

class BudgetTrackerHomePage extends StatefulWidget {
  @override
  _BudgetTrackerHomePageState createState() => _BudgetTrackerHomePageState();
}

class _BudgetTrackerHomePageState extends State<BudgetTrackerHomePage> {
  double totalBudget = 0; // Stores the total budget amount
  double expense = 0; // Stores the current expense amount

  void updateTotal(double amount) {
    setState(() {
      totalBudget = amount;
      expense = 0; // Reset expense after update
    });
  }

  void deductExpense(double amount) {
    setState(() {
      expense = amount;
      if (expense <= totalBudget) {
        totalBudget -= expense;
      } else {
        // Handle exceeding budget scenario (optional: show warning)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Tracker'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Initial Budget',
              ),
              onSubmitted: (value) {
                updateTotal(double.parse(value));
              },
            ),
            SizedBox(height: 20.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Expense',
              ),
              onSubmitted: (value) {
                deductExpense(double.parse(value));
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Total Budget: \Rs' + totalBudget.toStringAsFixed(2), // Display formatted budget
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Expense: \Rs' + expense.toStringAsFixed(2), // Display formatted expense
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
