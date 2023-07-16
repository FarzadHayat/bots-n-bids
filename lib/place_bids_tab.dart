import 'package:bots_n_bids/constants.dart';
import 'package:bots_n_bids/penalty_entry.dart';
import 'package:bots_n_bids/team.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'globals.dart';

class PlaceBidsTab extends StatefulWidget {
  const PlaceBidsTab({super.key});

  @override
  State<PlaceBidsTab> createState() => _PlaceBidsTabState();
}

class _PlaceBidsTabState extends State<PlaceBidsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        image: DecorationImage(
          image: AssetImage('assets/images/bidding.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
