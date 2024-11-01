import 'package:hive/hive.dart';

// part 'expense_model.g.dart';


class Expense{
   Expense({required this.category, required this.amount, required this.date });
  @HiveField(0)
final String category;
  @HiveField(1)
final double amount;
  @HiveField(2)
final DateTime date;
}