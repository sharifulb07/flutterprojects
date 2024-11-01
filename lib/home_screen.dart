import 'package:expensetracker_app/main.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:fl_chart/fl_chart.dart';
import 'expense_model.dart';
import 'add_expense_screen.dart';

class HomeScreen extends StatelessWidget {
  final box = Hive.box<Expense>('expenses');


  List<PieChartSectionData> _getPieChartData() {
    final expenses = box.values.toList();
    final Map<String, double> categoryTotals = {};

    for (var expense in expenses) {
      categoryTotals.update(expense.category, (value) => value + expense.amount,
          ifAbsent: () => expense.amount);
    }

    return categoryTotals.entries.map((entry) {
      return PieChartSectionData(
        title: entry.key,
        value: entry.value,
        color: Colors.primaries[
            categoryTotals.keys.toList().indexOf(entry.key) %
                Colors.primaries.length],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expense Tracker')),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: PieChart(PieChartData(sections: _getPieChartData())),
          ),
          Expanded(
            child: StreamBuilder(
              stream: box.watch(), // Stream to watch changes in the Hive box
              builder: (context, snapshot) {
                final expenses = box.values.toList();
                return ListView.builder(
                  itemCount: expenses.length,
                  itemBuilder: (context, index) {
                    final expense = expenses[index];
                    return ListTile(
                      title: Text(expense.category),
                      subtitle: Text(
                          '\$${expense.amount.toStringAsFixed(2)} on ${expense.date.toLocal()}'),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddExpenseScreen()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
