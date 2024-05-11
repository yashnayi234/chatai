
import 'package:chatai/screen/chatai.dart';
import 'package:flutter/material.dart';
import '../chat_provider/chat_provider.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatGPTProvider _chatGPTProvider = ChatGPTProvider();
  final _controller = TextEditingController();
  final List<ChatAI> _messages = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
