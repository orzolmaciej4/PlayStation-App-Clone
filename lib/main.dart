import 'package:flutter/material.dart';
import 'screens/play_screen.dart';
import 'screens/explore_screen.dart';
import 'screens/ps_store_screen.dart';
import 'screens/game_library_screen.dart';
import 'screens/search_screen.dart';
import 'screens/friends/messages_screen.dart';
import 'screens/friends/friends.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  final List<Widget> _screens = [
    PlayScreen(),
    ExploreScreen(),
    const PSStoreScreen(),
    GameLibraryScreen(),
    SearchScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlayStation App Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: _navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.chat_rounded),
            color: Colors.grey,
            onPressed: () {
              _navigatorKey.currentState?.push(
                MaterialPageRoute(
                  builder: (context) => MessagesScreen(),
                ),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.face_6_rounded),
              color: Colors.grey,
              onPressed: () {
                _navigatorKey.currentState?.push(
                  MaterialPageRoute(
                    builder: (context) => FriendsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: Material(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            color: Colors.white,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_filled_outlined),
                  label: 'Play',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store),
                  label: 'PS Store',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.games),
                  label: 'Game Library',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
              ],
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 12.0,
              unselectedFontSize: 10.0,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
    //);
  }
}
