import 'package:flutter/material.dart';
import 'package:my_notes_app/constants.dart';
import 'package:my_notes_app/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: background,
        fontFamily: "Poppins",
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: primary,
            fontSize: 32,
              fontFamily: "Fredoka",
              fontWeight: FontWeight.bold
          )
        )
      ),
      home:MainPage(),
    );
  }
}



