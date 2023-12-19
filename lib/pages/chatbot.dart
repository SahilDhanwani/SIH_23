// ignore: unused_import, avoid_web_libraries_in_flutter
//import 'dart:js_util';

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:sih_23_audiometer/pages/Messages.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  late DialogFlowtter dialogFlowtter;

  // ignore: unused_field
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instanceo) => dialogFlowtter = instanceo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('KarnBot'),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          child: Column(
            children: [
              Expanded(child: MessagesScreen(messages: messages)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                color: Colors.deepPurple,
                child: Row(children: [
                  Expanded(
                      child: TextField(
                          controller: _controller,
                          style: const TextStyle(color: Colors.white))),
                  IconButton(
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: const Icon(Icons.send))
                ]),
              )
            ],
          ),
        ));
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      // ignore: avoid_print
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
