import 'package:flutter/material.dart';
import '../services/data.dart';

class SearchScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool gORp = false;
  String text = 'game';
  late List currentList = trendingGames;
  late List searchList = games;
  final TextEditingController _textController = TextEditingController();

  void gamesOrPlayers(bool x) {
    if (x == true) {
      currentList = playersYouMayKnow;
      searchList = players;
      text = 'player';
    } else {
      currentList = trendingGames;
      searchList = games;
      text = 'game';
    }
  }

  void search(String query) {
    late String itemName;
    setState(() {
      if (query.isEmpty) {
        currentList = List.from(gORp ? playersYouMayKnow : trendingGames);
      } else {
        currentList = searchList.where((item) {
          if (searchList == games) {
            itemName = item.toLowerCase();
          } else {
            itemName = item.name.toLowerCase();
          }
          final searchQuery = query.toLowerCase();
          return itemName.contains(searchQuery);
        }).toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    gamesOrPlayers(gORp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text('Search'),
      //),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  //Icon(Icons.search),
                  //SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      onChanged: search,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search for a ${text}',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        filled: true,
                        fillColor: Colors.black12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ButtonBar(alignment: MainAxisAlignment.start, children: [
              OutlinedButton(
                child: Text('Games', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  setState(() {
                    gORp = false;
                    gamesOrPlayers(gORp);
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (gORp == false) {
                        return Colors.black38;
                      }
                      return Colors.black12;
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                child: Text('Players', style: TextStyle(color: Colors.black)),
                onPressed: () {
                  setState(() {
                    gORp = true;
                    gamesOrPlayers(gORp);
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (states) {
                      if (gORp == true) {
                        return Colors.black38;
                      }
                      return Colors.black12;
                    },
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ]),
            if (_textController.text.isEmpty)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(gORp ? 'Players you may know' : 'Trending Games',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.left),
              ),
            Expanded(
              child: gORp
                  ? ListView.builder(
                      itemCount: currentList.length,
                      itemBuilder: (context, index) {
                        final player = currentList[index];
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage(player.imagePath),
                          ),
                          title: Text(player.name),
                        );
                      },
                    )
                  : GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      children: currentList.map((game) {
                        return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/games/${game}.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ));
                      }).toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
