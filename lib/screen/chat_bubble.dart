import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  ChatBubble({required this.message, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(8),
        constraints: BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isSentByMe ? Color(0xFF3EC254) : Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isSentByMe ? Radius.circular(15) : Radius.circular(0),
            bottomRight: isSentByMe ? Radius.circular(0) : Radius.circular(15),
          ),
        ),
        child: Text(
          message,
          style: GoogleFonts.poppins(color: isSentByMe ? Colors.white : Colors.white.withOpacity(0.7)),
        ),
      ),
    );
  }
}
