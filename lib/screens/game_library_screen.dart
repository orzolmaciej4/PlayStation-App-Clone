import 'package:flutter/material.dart';
import '../services/game.dart';
import '../services/data.dart';

class GameLibraryScreen extends StatefulWidget {
  @override
  _GameLibraryScreenState createState() => _GameLibraryScreenState();
}

class _GameLibraryScreenState extends State<GameLibraryScreen> {
  String selectedSortOption = 'Recently Played';
  late List<Game> currentList;
  bool play = true;
  String playOrPurch = 'Recently Played';

  final ScrollController _scrollController = ScrollController();
  bool _showRow = true;

  void playOrPurchase(bool x) {
    if (x == true) {
      playOrPurch = 'Recently Played';
      currentList = gamesPlayed;
      sortGamesByLastPlayed(currentList);
      setState(() {
        selectedSortOption = playOrPurch;
      });
    } else {
      playOrPurch = 'Purchase Date';
      currentList = gamesPurchased;
      sortGamesByPurchaseDate(currentList);
      setState(() {
        selectedSortOption = playOrPurch;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    playOrPurchase(play);

    _scrollController.addListener(() {
      if (_scrollController.offset > 0 && _showRow) {
        setState(() {
          _showRow = false;
        });
      } else if (_scrollController.offset <= 0 && !_showRow) {
        setState(() {
          _showRow = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Game> sortedGames = [];

    switch (selectedSortOption) {
      case 'Recently Played':
        sortedGames = sortGamesByLastPlayed(currentList);
        break;
      case 'Purchase Date':
        sortedGames = sortGamesByPurchaseDate(currentList);
        break;
      case 'Name(A - Z)':
        sortedGames = sortGamesAlphabetically(currentList);
        break;
      case 'Name(Z - A)':
        sortedGames = sortGamesReverseAlphabeticalOrder(currentList);
        break;
      default:
        sortedGames = currentList;
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            AnimatedOpacity(
              opacity: _showRow ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: ButtonBar(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(
                    child:
                        Text('Played', style: TextStyle(color: Colors.black)),
                    onPressed: () {
                      play = true;
                      playOrPurchase(play);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          if (play == true) {
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
                    child: Text(
                      'Purchased',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      play = false;
                      playOrPurchase(play);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          if (play == false) {
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
                  PopupMenuButton<String>(
                    onSelected: (String result) {
                      setState(() {
                        selectedSortOption = result;
                      });
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: playOrPurch,
                        child: Text(playOrPurch),
                      ),
                      PopupMenuItem<String>(
                        value: 'Name(A - Z)',
                        child: Text('Name(A - Z)'),
                      ),
                      PopupMenuItem<String>(
                        value: 'Name(Z - A)',
                        child: Text('Name(Z - A)'),
                      ),
                    ],
                    icon: Icon(Icons.sort, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                controller: _scrollController,
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                children: sortedGames.map((game) {
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
                            'assets/images/games/${game.title}.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                      /*SizedBox(height: 8.0),
                      Text(
                        game.title,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),*/
                      );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
