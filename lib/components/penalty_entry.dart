import 'package:bots_n_bids/constants.dart';
import 'package:bots_n_bids/components/round_icon_button.dart';
import 'package:flutter/material.dart';

class PenaltyEntry extends StatefulWidget {
  final String label;
  int score = 0;
  final int increment;

  PenaltyEntry({
    super.key,
    required this.label,
    required this.increment,
  });

  @override
  State<PenaltyEntry> createState() => _PenaltyEntryState();
}

class _PenaltyEntryState extends State<PenaltyEntry> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.label,
          style: kTextPenaltyEntry,
        ),
        Row(
          children: [
            RoundIconButton(
              icon: Icons.remove,
              onPress: () {
                if (widget.score > 0) {
                  setState(() {
                    widget.score -= widget.increment;
                  });
                }
              },
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              widget.score.toString(),
              style: kTextPenaltyEntry,
            ),
            const SizedBox(
              width: 10.0,
            ),
            RoundIconButton(
              icon: Icons.add,
              onPress: () {
                setState(() {
                  widget.score += widget.increment;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
