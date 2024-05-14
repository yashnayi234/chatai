import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../chat_provider/fetch_ai_response.dart';
import '../chat_provider/message.dart';
import 'chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  final String apiKey;

  ChatScreen({required this.apiKey});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() async {
    if (_controller.text.isEmpty) {
      return;
    }

    setState(() {
      messages.add(Message(text: _controller.text, isSentByMe: true));
    });

    String userMessage = _controller.text;
    _controller.clear();

    // Fetch AI response
    try {
      String aiResponse = await fetchAIResponse(widget.apiKey, userMessage);
      setState(() {
        messages.add(Message(text: aiResponse, isSentByMe: false));
      });
    } catch (e) {
      print('Error: $e'); // Debug: Print the error
      setState(() {
        messages.add(Message(text: "Error: Unable to get AI response", isSentByMe: false));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF112F3A),
      ),
      constraints: BoxConstraints.expand(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Chat', style: GoogleFonts.poppins(color: Colors.white)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[messages.length - 1 - index];
                  return ChatBubble(
                    message: message.text,
                    isSentByMe: message.isSentByMe,
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade800.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.transparent,
                        filled: true,
                      ),
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    color: Colors.white,
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
