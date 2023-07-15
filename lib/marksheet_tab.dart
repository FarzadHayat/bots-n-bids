import 'package:bots_n_bids/constants.dart';
import 'package:bots_n_bids/penalty_entry.dart';
import 'package:flutter/material.dart';

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

  final TextEditingController _textEditingController = TextEditingController();
  String _timeValue = '';
  String _teamNameValue = '';

  @override
  void dispose() {
    // Dispose the controller when the widget is disposed
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              children: penalties,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('ENTER TIME', style: kTextPenaltyEntry),
              SizedBox(
                width: 200.0,
                child: TextField(
                  controller: _textEditingController,
                  onChanged: (value) {
                    // Update the value whenever the text changes
                    setState(() {
                      _timeValue = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your username here',
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('TEAM NAME', style: kTextPenaltyEntry),
              SizedBox(
                width: 200.0,
                child: TextField(
                  controller: _textEditingController,
                  onChanged: (value) {
                    // Update the value whenever the text changes
                    setState(() {
                      _teamNameValue = value;
                    });
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your username here',
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
            ),
            onPressed: () {},
            child: const Text(
              'SUBMIT SCORE',
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
