import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:psikolog/models/chat.dart';
import 'package:psikolog/models/schedules.dart';
import 'package:psikolog/providers/auth_provider.dart';
import 'package:psikolog/services/chat_service.dart';

class ChatPage extends StatefulWidget {
  final Schedules schedules;
  const ChatPage({super.key, required this.schedules});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late List<Chat> chat;
  var isLoaded = false;
  var itemCount = 0;

  TextEditingController messageController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    getChat();
  }

  getChat() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    Timer.periodic(const Duration(seconds: 2), (timer) async {
      print(timer.tick);

      chat = await ChatService()
          .getDataChat(token: authProvider.auth?.accessToken, id: widget.schedules.id);

      if (chat.length.toInt() > 0) {
        setState(() {
          isLoaded = false;
          itemCount = chat.length;
        });
      }
    });
  }

  handleAddMessage() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    if (await ChatService().postChat(
      token: authProvider.auth?.accessToken,
      scheduleId: widget.schedules.id,
      messages: messageController.text
    )) {
      messageController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Error!",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Chat Konsultasi',
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        child: ListView.builder(
          itemCount: itemCount,
          // itemCount: 5,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(2),
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              width: 50,
              child: Column(
                crossAxisAlignment: chat[index].isSender == true
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: chat[index].isSender == true
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.6),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: chat[index].isSender == true
                                ? Colors.grey
                                : Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  chat[index].isSender == true ? 12 : 0),
                              topRight: Radius.circular(
                                  chat[index].isSender == true ? 0 : 12),
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: chat[index].isSender == true
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${chat[index].messages}',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${chat[index].createdAt}',
                                style: TextStyle(
                                    color: Colors.white60, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextFormField(
                        controller: messageController,
                        style: TextStyle(color: Colors.black87),
                        decoration: InputDecoration.collapsed(
                          hintText: "Type Message...",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: handleAddMessage,
                  child: Icon(
                    Icons.send,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
