import 'package:bots_n_bids/constants.dart';
import 'package:flutter/material.dart';

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
        color: kColorButton,
        image: DecorationImage(
          image: AssetImage('assets/images/place_bids.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
