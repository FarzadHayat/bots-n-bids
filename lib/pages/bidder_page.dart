import 'package:bots_n_bids/tabs/profile_tab.dart';
import 'package:bots_n_bids/tabs/scoreboard_tab.dart';
import 'package:flutter/material.dart';

import '../data/profile.dart';
import '../tabs/place_bids_tab.dart';
import '../constants.dart';
import '../tabs/view_bids_tab.dart';

class BidderPage extends StatefulWidget {
  const BidderPage({super.key});

  static const String id = 'bidder_page';

  @override
  State<BidderPage> createState() => _BidderPageState();
}

class _BidderPageState extends State<BidderPage> {
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
          ProfilePage(memberType: MemberType.Spectator),
          PlaceBidsTab(),
          ViewBidsTab(),
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
              'assets/icons/bids.png',
              width: 50.0,
              height: 50.0,
            ),
            label: 'Place bids',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/search.png',
              width: 50.0,
              height: 50.0,
            ),
            label: 'View bids',
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
