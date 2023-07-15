import 'package:bots_n_bids/constants.dart';
import 'package:bots_n_bids/round_icon_button.dart';
import 'package:flutter/material.dart';

class PenaltyEntry extends StatefulWidget {
  final String label;

  const PenaltyEntry({super.key, required this.label});

  @override
  State<PenaltyEntry> createState() => _PenaltyEntryState();
}

class _PenaltyEntryState extends State<PenaltyEntry> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.label,
          style: kTextBodyHeader,
        ),
        RoundIconButton(
          icon: Icons.add,
          onPress: () {},
        ),
        RoundIconButton(
          icon: Icons.add,
          onPress: () {},
        ),
        Card(
          child: Text('10'),
        ),
      ],
    );
  }
}
