import 'package:bots_n_bids/constants.dart';
import 'package:flutter/material.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({super.key});

  @override
  State<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  List<Map<String, dynamic>> competitors = [
    {'teamName': 'John', 'lapTime': '1:23'},
    {'teamName': 'Sarah', 'lapTime': '1:45'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    {'teamName': 'Michael', 'lapTime': '1:30'},
    // Add more competitors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        image: DecorationImage(
          image: AssetImage('assets/images/scoreboard.jpg'),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        children: [
          Text('Scoreboard', style: kTextBodyHeader),
          Expanded(
            child: ListView.builder(
              itemCount: competitors.length,
              itemBuilder: (context, index) {
                final competitor = competitors[index];

                return ListTile(
                  leading: Text('${index + 1}', style: kText),
                  title: Text(competitor['teamName'], style: kText),
                  trailing:
                      Text('Lap Time: ${competitor['lapTime']}', style: kText),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
