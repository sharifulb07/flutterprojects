import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message, required this.isSentByMe});
  final String message;
  final bool isSentByMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe? Alignment.centerRight:Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isSentByMe?Colors.blue:Colors.white,
          borderRadius: BorderRadius.only(
            topRight:const  Radius.circular(15),
            topLeft:const Radius.circular(15),
            bottomLeft: isSentByMe? const Radius.circular(15):Radius.zero,
            bottomRight: isSentByMe?  Radius.zero:const Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5
            )
          ]

        ),
          child: Text(
            message,
            style: TextStyle(
              color: isSentByMe? Colors.white:Colors.blue
            ),
            softWrap: true,
          ),

      ),
    );
  }
}
