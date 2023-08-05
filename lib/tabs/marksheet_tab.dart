import 'package:bots_n_bids/constants.dart';
import 'package:bots_n_bids/components/penalty_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/rounded_button.dart';

class MarksheetPage extends StatefulWidget {
  const MarksheetPage({super.key});

  @override
  State<MarksheetPage> createState() => _MarksheetPageState();
}

class _MarksheetPageState extends State<MarksheetPage> {
  List<PenaltyEntry> penalties = [
    PenaltyEntry(label: '1 Wheel outside boundaries', increment: 2),
    PenaltyEntry(label: 'Multi wheel outside boundaries', increment: 5),
    PenaltyEntry(label: 'Non-stopping collision', increment: 5),
    PenaltyEntry(label: 'Stopping collision', increment: 20),
    PenaltyEntry(label: 'Taking Right Fork', increment: -5),
  ];

  final TextEditingController _timeController = TextEditingController();
  String _timeValue = '';
  final TextEditingController _teamNameController = TextEditingController();
  String _teamNameValue = '';

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    for (PenaltyEntry penalty in penalties) {
      penalty.count = 0;
    }
    _timeController.dispose();
    _teamNameController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kColorButton,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: penalties,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('TEAM NAME', style: kTextPenaltyEntry),
                  SizedBox(
                    width: 200.0,
                    child: TextField(
                      controller: _teamNameController,
                      onChanged: (value) {
                        // Update the value whenever the text changes
                        setState(() {
                          _teamNameValue = value;
                        });
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your team name',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('TIME (seconds)', style: kTextPenaltyEntry),
                  SizedBox(
                    width: 200.0,
                    child: TextField(
                      controller: _timeController,
                      onChanged: (value) {
                        // Update the value whenever the text changes
                        setState(() {
                          _timeValue = value;
                        });
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Enter your time here',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 80.0,
              ),
              child: RoundedButton(
                onPressed: () {
                  setState(() {
                    // Team team = Team(_teamNameValue, []);
                    // team.addLap(
                    //     timeInSeconds: int.parse(_timeValue),
                    //     penalties: penalties);
                    // Globals().teams.add(team);
                  });
                },
                title: 'SUBMIT SCORE',
                color: kColorButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
