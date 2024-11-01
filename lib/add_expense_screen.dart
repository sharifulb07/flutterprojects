import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'expense_model.dart';


class AddExpenseScreen extends StatelessWidget {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void _saveExpense(BuildContext context) async {
    final box = Hive.box<Expense>("expenses");
    final expense = Expense(
        category: _categoryController.text.trim(),
        amount: double.parse(_amountController.text.trim()),
        date: DateTime.now());
    await box.add(expense);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Expenses"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _categoryController,
              decoration: const InputDecoration(hintText: "Category"),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(hintText: "Amount"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => _saveExpense(context),
                child: const Text('Save Expense'))
          ],
        ),
      ),
    );
  }
}
