import 'package:flutter/material.dart';
import 'package:shoppinglist_app/shopping_list_screen.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: 'Shopping List Item ',
      home: const ShoppingListScreen(),
    );
  }
}


