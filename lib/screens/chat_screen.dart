import 'dart:async';
import 'chat_bubble.dart';

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [];
  bool isTyping = false;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    String message = _controller.text.trim();
    if (message.isEmpty) return;
    setState(() {
      _messages.add({"message": message, "isSentByMe": true});
      isTyping = true;
    });

    _controller.clear();

    scrollToBottom();

    Timer(const Duration(seconds: 2), () {
      setState(() {
        isTyping = false;
        _messages.add({
          "message": "Your friend's auto-generated reply",
          "isSentByMe": false
        });
      });
      scrollToBottom();
    });
  }

  void scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                controller: _scrollController,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                      message: _messages[index]["message"],
                      isSentByMe: _messages[index]["isSentByMe"]);
                }),
          ),
          if (isTyping)
            const Padding(
              padding: EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Your Friend is typing ....",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:const  InputDecoration(
                        helperText: "Enter a message",
                        border: OutlineInputBorder()),
                    minLines: 1,
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                  ),
                ),
                IconButton(onPressed: _sendMessage, icon: const Icon(Icons.send, size: 30,))
              ],
            ),
          )
        ],
      ),
    );
  }
}
