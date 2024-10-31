import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

void main(){

  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat App",
      home: ChatScreen(),
    );
  }
}
