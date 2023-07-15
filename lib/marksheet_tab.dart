import 'package:bots_n_bids/constants.dart';
import 'package:bots_n_bids/penalty_entry.dart';
import 'package:flutter/material.dart';

class MarksheetPage extends StatefulWidget {
  const MarksheetPage({super.key});

  @override
  State<MarksheetPage> createState() => _MarksheetPageState();
}

class _MarksheetPageState extends State<MarksheetPage> {
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
              children: [
                PenaltyEntry(label: '1 Wheel outside boundaries', increment: 2),
                PenaltyEntry(
                    label: 'Multi wheel outside boundaries', increment: 5),
                PenaltyEntry(label: 'Non-stopping collision', increment: 5),
                PenaltyEntry(label: 'Stopping collision', increment: 20),
                PenaltyEntry(label: 'Taking Right Fork', increment: -5),
              ],
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ENTER TIME', style: kTextPenaltyEntry),
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
