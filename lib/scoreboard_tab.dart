import 'package:bots_n_bids/constants.dart';
import 'package:bots_n_bids/team.dart';
import 'package:flutter/material.dart';

import 'globals.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({super.key});

  @override
  State<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage> {
  List<Team> teams = Globals().getTeams();

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
          const SizedBox(
            height: 20.0,
          ),
          const Text('Scoreboard', style: kTextBodyHeader),
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
                      style: kTextBodyHeader.copyWith(color: Colors.amber)),
                  title: Text(competitor.name, style: kText),
                  trailing: Text('Lap Time: ${competitor.getLapTimeAsString()}',
                      style: kText),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
