import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final onlineFriends = [
      _buildFriend(
        context,
        'Maciej',
        'assets/images/avatars/avatar47.jpg',
        true,
      ),
      _buildFriend(
        context,
        'PlatinumTrophyKing',
        'assets/images/avatars/avatar14.jpg',
        true,
      ),
      _buildFriend(
        context,
        'PlayStationGuru',
        'assets/images/avatars/avatar8.jpg',
        true,
      ),
      _buildFriend(
        context,
        'OrlandaAdam',
        'assets/images/avatars/avatar49.jpg',
        true,
      ),
      _buildFriend(
        context,
        'MagicOrzol123',
        'assets/images/avatars/avatar44.jpg',
        true,
      ),
    ];

    final offlineFriends = [
      _buildFriend(
        context,
        'DualShockLegend',
        'assets/images/avatars/avatar21.jpg',
        false,
      ),
      _buildFriend(
        context,
        'KratosGamer23',
        'assets/images/avatars/avatar33.jpg',
        false,
      ),
      _buildFriend(
        context,
        'RatchetAndNinja77',
        'assets/images/avatars/avatar12.jpg',
        false,
      ),
      _buildFriend(
        context,
        'FifaForLife23',
        'assets/images/avatars/avatar45.jpg',
        false,
      ),
      _buildFriend(
        context,
        'CLTheMuffinMan12',
        'assets/images/avatars/avatar36.jpg',
        false,
      ),
    ];

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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        children: [
          SizedBox(height: 24.0),
          Text(
            'Friends',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Online',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 250.0,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: onlineFriends.length,
              itemBuilder: (context, index) {
                return onlineFriends[index];
              },
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Offline',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 250.0,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: offlineFriends.length,
              itemBuilder: (context, index) {
                return offlineFriends[index];
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFriend(
    BuildContext context,
    String name,
    String thumbnailPath,
    bool online,
  ) {
    return Container(
      width: 120.0,
      margin: EdgeInsets.only(right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage(thumbnailPath),
              ),
              SizedBox(width: 10.0),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                online ? 'Online' : 'Offline',
                style: TextStyle(
                  color: online ? Colors.green : Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
        ],
      ),
    );
  }
}
