import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key});

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
          backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  _buildFriend(
                    context,
                    'Maciej',
                    'assets/images/avatars/avatar47.jpg',
                    true,
                    'Fine',
                    '2/5',
                  ),
                  _buildFriend(
                    context,
                    'DualShockLegend',
                    'assets/images/avatars/avatar21.jpg',
                    false,
                    'Hey',
                    '21/4',
                  ),
                  _buildFriend(
                    context,
                    'PlatinumTrophyKing',
                    'assets/images/avatars/avatar14.jpg',
                    true,
                    ':)',
                    '11/5',
                  ),
                  _buildFriend(
                    context,
                    'KratosGamer23',
                    'assets/images/avatars/avatar33.jpg',
                    false,
                    'Hello, how are you?',
                    '9/5',
                  ),
                  _buildFriend(
                    context,
                    'RatchetAndNinja77',
                    'assets/images/avatars/avatar12.jpg',
                    false,
                    'Hey',
                    '6/5',
                  ),
                  _buildFriend(
                    context,
                    'PlayStationGuru',
                    'assets/images/avatars/avatar8.jpg',
                    true,
                    '',
                    '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFriend(
    BuildContext context,
    String name,
    String thumbnailPath,
    bool online,
    String lastMessage,
    String lastMessageDate,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              friendName: name,
              avatar: thumbnailPath,
              onlineStatus: online,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: online ? Colors.green : Colors.blueGrey,
                  width: online ? 4.0 : 0.0,
                ),
              ),
              child: CircleAvatar(
                radius: 30.0,
                foregroundImage: AssetImage(thumbnailPath),
              ),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  lastMessage,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  lastMessageDate,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
