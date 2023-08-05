import 'package:bots_n_bids/constants.dart';
import 'package:bots_n_bids/data/team.dart';
import 'package:flutter/material.dart';

import '../database.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({super.key});

  @override
  State<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  List<Team> teams = Globals().teams;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color: kColorButton,
        image: DecorationImage(
          image: AssetImage('assets/images/scoreboard.jpg'),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Text('Scoreboard', style: kTextHeader),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: teams.length,
              itemBuilder: (context, index) {
                final competitor = teams[index];

                return ListTile(
                  leading: Text('${index + 1}',
                      style: kTextHeader.copyWith(color: Colors.amber)),
                  title: Text(competitor.name, style: kTextBody),
                  trailing:
                      Text('Lap Time: ${competitor.time}', style: kTextBody),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
