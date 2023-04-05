import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            decoration:
                const InputDecoration.collapsed(hintText: "Ask Something"),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(child: ListView.builder(itemBuilder: (context, index) {
              return Container(
                height: 100,
                color: Color.fromARGB(255, 150, 216, 252),
              );
            })),
            Container(
              decoration: BoxDecoration(),
              child: _buildTextComposer(),
            )
          ],
        ),
      ),
    );
  }
}
