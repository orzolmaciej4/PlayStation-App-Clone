import 'dart:io';
import 'dart:ui';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../../services/message.dart';

class ChatScreen extends StatefulWidget {
  final String friendName;
  final String avatar;
  final bool onlineStatus;

  const ChatScreen({
    Key? key,
    required this.friendName,
    required this.avatar,
    required this.onlineStatus,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
    loadMessagesFromFile();
  }

  void loadMessagesFromFile() async {
    try {
      final messagesContent =
          await rootBundle.loadString('assets/chat_messages.txt');
      final List<dynamic> jsonData = json.decode(messagesContent);

      final List<Message> loadedMessages = jsonData.map((data) {
        return Message(
          id: data['id'],
          text: data['text'],
          sender: data['sender'],
          receiver: data['receiver'],
          timestamp: DateTime.parse(data['timestamp']),
        );
      }).toList();

      setState(() {
        messages = loadedMessages;
      });
    } catch (e) {
      print('An error occurred while reading the file: $e');
    }
  }

  void composeMessage() {
    final message = Message(
      id: messages.length,
      text: _textController.text,
      sender: 'User',
      receiver: widget.friendName,
      timestamp: DateTime.now(),
    );
    updateMessages(message);
    _textController.clear();
    writeMessagesToFile();
  }

  Future<void> writeMessagesToFile() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/new_chat_messages.txt');
      final List<Map<String, dynamic>> jsonData = messages.map((message) {
        return {
          'id': message.id,
          'text': message.text,
          'sender': message.sender,
          'receiver': message.receiver,
          'timestamp': message.timestamp.toIso8601String(),
        };
      }).toList();

      await file.writeAsString(json.encode(jsonData));
      print('Messages written to file: ${file.path}');
    } catch (e) {
      print('An error occurred while writing the file: $e');
    }
  }

  void updateMessages(Message newMessage) {
    setState(() {
      messages.add(newMessage);
    });
  }

  @override
  void dispose() {
    if (messages.isNotEmpty) {
      writeMessagesToFile();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.grey),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          backgroundColor: Colors.white,
          elevation: 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.avatar),
                    radius: 25.0,
                  ),
                  SizedBox(width: 16.0),
                  Text(
                    widget.friendName,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    widget.onlineStatus ? 'Online' : 'Offline',
                    style: TextStyle(fontSize: 13.0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isUserMessage = message.sender == 'User';

                bool isFirstMessageOnDate = false;
                if (index == 0) {
                  isFirstMessageOnDate = true;
                } else {
                  final previousMessage = messages[index - 1];
                  final currentDate = DateTime(
                    message.timestamp.year,
                    message.timestamp.month,
                    message.timestamp.day,
                  );
                  final previousDate = DateTime(
                    previousMessage.timestamp.year,
                    previousMessage.timestamp.month,
                    previousMessage.timestamp.day,
                  );
                  if (currentDate != previousDate) {
                    isFirstMessageOnDate = true;
                  }
                }

                if (message.sender == widget.friendName ||
                    message.receiver == widget.friendName) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 25.0,
                    ),
                    child: Column(
                      children: [
                        if (isFirstMessageOnDate)
                          Text(
                            '${message.timestamp.day}/${message.timestamp.month}/${message.timestamp.year}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.0,
                            ),
                          ),
                        Padding(padding: EdgeInsets.all(5.0)),
                        Align(
                          alignment: isUserMessage
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: isUserMessage
                                      ? Colors.grey[700]
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      message.text,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: isUserMessage
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      message.timestamp
                                          .toString()
                                          .split(' ')[1]
                                          .substring(0, 5),
                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: isUserMessage
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*if (!isUserMessage)
                                Positioned(
                                  bottom: 0,
                                  left: -10,
                                  child: CircleAvatar(
                                    backgroundImage: AssetImage(widget.avatar),
                                    radius: 12.0,
                                  ),
                                ),*/
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                IconButton(
                  icon: Icon(Icons.send_rounded),
                  onPressed: composeMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
