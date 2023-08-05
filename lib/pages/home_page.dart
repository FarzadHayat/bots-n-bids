import 'package:bots_n_bids/tabs/profile_tab.dart';
import 'package:bots_n_bids/tabs/scoreboard_tab.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../data/profile.dart';
import '../tabs/marksheet_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String id = 'home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bots \'n Bids'),
        backgroundColor: kColorForeground,
        leading: const SizedBox(),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          ProfilePage(memberType: MemberType.Judge),
          MarksheetPage(),
          ScoreboardPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade900,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/profile.png',
              width: 50.0,
              height: 50.0,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/marksheet.png',
              width: 50.0,
              height: 50.0,
            ),
            label: 'Marksheet',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/scoreboard.png',
              width: 50.0,
              height: 50.0,
            ),
            label: 'Scoreboard',
          ),
        ],
      ),
    );
  }
}
