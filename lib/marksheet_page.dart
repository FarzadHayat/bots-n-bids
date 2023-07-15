import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class MarksheetPage extends StatefulWidget {
  const MarksheetPage({super.key});

  @override
  State<MarksheetPage> createState() => _MarksheetPageState();
}

class _MarksheetPageState extends State<MarksheetPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bots \'n Bids'),
        backgroundColor: kSecondaryColor,
      ),
      body: Container(
        color: kPrimaryColor,
        child: Center(
          child: Text(
            'Selected Index: $_currentIndex',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade800,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/profile.jpg',
              width: 50.0,
              height: 50.0,
            ),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/marksheet.jpg',
              width: 50.0,
              height: 50.0,
            ),
            label: 'Marksheet',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/scoreboard.jpg',
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
