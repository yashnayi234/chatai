
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chat_screen.dart';

class ChatAIHomeScreen extends StatefulWidget {
  const ChatAIHomeScreen({super.key, required this.apiKey});
  final String apiKey;

  @override
  State<ChatAIHomeScreen> createState() => _ChatAIHomeScreenState();
}

class _ChatAIHomeScreenState extends State<ChatAIHomeScreen> {

  String apikey = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apikey = widget.apiKey;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF112F3A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 200,
                  child: Image.asset('assets/Chat-ai.png'),
                  alignment: Alignment.center,
                ),
                Text(
                  'Welcome to the ChatAI',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(10),
        height: 55,
        child: CupertinoButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(apiKey: apikey),));
          },
          color: Color(0xFF3EC254),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Text(
            'Start with ChatAI',
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 17,
              )
            ),
          ),

        ),
      ),
    );
  }
}