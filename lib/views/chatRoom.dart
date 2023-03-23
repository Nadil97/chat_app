import 'package:chat_app/service/auth.dart';
import 'package:chat_app/views/signIn.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({super.key});

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  AuthMethod authMethod = new AuthMethod();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00008B),
        title: Image.asset(
          'assets/images/logo.png',
          height: 70,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              authMethod.signOut();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: Container(child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
    );
  }
}
