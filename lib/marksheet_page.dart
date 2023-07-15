import 'package:bots_n_bids/constants.dart';
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
      child: const Column(
        children: [
          Row(
            children: [
              Text('TEAM'),
            ],
          ),
        ],
      ),
    );
  }
}
