import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            SizedBox(
              height: 50.0,
              width: 400.0,
              child: Row(children: [
                const SizedBox(width: 18.0),
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/images/other/user.jpg'),
                ),
                const SizedBox(width: 10.0),
                Text(
                  'Maciej Orzol',
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(width: 20),
                CircleAvatar(
                  radius: 13.0,
                  backgroundImage:
                      AssetImage('assets/images/other/psstars.jpg'),
                ),
                const SizedBox(width: 30.0),
                Icon(Icons.notifications, color: Colors.grey),
                const SizedBox(width: 30.0),
                Icon(Icons.settings, color: Colors.grey)
              ]),
            ),
            SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                'Recently Played',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(
              height: 470.0,
              width: 400.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  _buildRecentGameCard(
                    context,
                    'Star Wars Jedi Survivor',
                    'assets/images/games/Star Wars Jedi Survivor.jpg',
                    [7, 2, 1, 0, 54],
                  ),
                  _buildRecentGameCard(
                    context,
                    'Minecraft',
                    'assets/images/games/Minecraft.jpg',
                    [36, 11, 4, 0, 127],
                  ),
                  _buildRecentGameCard(
                    context,
                    'The Last of Us Part II',
                    'assets/images/games/The Last of Us Part II.jpg',
                    [10, 8, 7, 1, 26],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentGameCard(
      BuildContext context, String title, String thumbnailPath, List trophies) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250.0,
            width: 400.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(thumbnailPath),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 5.0),
          const Text(
            'Trophies',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          _buildTrophyDisplay(trophies),
        ],
      ),
    );
  }

  Widget _buildTrophyDisplay(List trophies) {
    int bronze = trophies[0];
    int silver = trophies[1];
    int gold = trophies[2];
    int platinum = trophies[3];
    int maxTrophies = trophies[4];

    int sum = bronze + silver + gold + platinum;
    double percentage = sum / maxTrophies * 100;

    return SizedBox(
        height: 150.0,
        width: 400.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Earned: $sum',
                      style: const TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 6.0,
                          left: 39.0,
                          child: CircularProgressIndicator(
                            value: percentage / 100,
                            strokeWidth: 4.0,
                            backgroundColor: Colors.grey,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.blue),
                          ),
                        ),
                        Center(
                          child: Text(
                            ' ${percentage.toInt()}%',
                            style: const TextStyle(
                                fontSize: 12.0, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Available: $maxTrophies',
                      style: const TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: _buildTrophy(
                        bronze, 'assets/images/trophies/bronze_trophy.jpg')),
                Expanded(
                    child: _buildTrophy(
                        silver, 'assets/images/trophies/silver_trophy.jpg')),
                Expanded(
                    child: _buildTrophy(
                        gold, 'assets/images/trophies/gold_trophy.jpg')),
                Expanded(
                    child: _buildTrophy(platinum,
                        'assets/images/trophies/platinum_trophy.jpg')),
              ],
            ),
          ],
        ));
  }

  Widget _buildTrophy(int num, String imagePath) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundColor: Colors.white,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: 60.0,
                height: 60.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              num.toString(),
              style: const TextStyle(fontSize: 14.0),
            ),
          ],
        ));
  }
}
