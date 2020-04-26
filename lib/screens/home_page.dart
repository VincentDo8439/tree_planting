import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:treeplanting/screens/quest_screen.dart';

import 'info_screen.dart';
import 'leaderboard_screen.dart';
import 'map_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  var _pageOptions = [
    QuestScreen(),
    MapScreen(),
    InfoScreen(),
    LeaderboardScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
                offset: Offset(0.0, 0.75))
          ],
        ),
        child: CurvedNavigationBar(
          height: MediaQuery.of(context).size.height / 14,
          backgroundColor: Colors.grey[200],
          items: <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.pin_drop, size: 30),
            Icon(Icons.nature, size: 30),
            Icon(Icons.insert_chart, size: 30),
            //Icon(Icons.account_circle, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
        ),
      ),
    );
  }
}
