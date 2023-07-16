import 'package:bots_n_bids/constants.dart';
import 'package:flutter/material.dart';

class ViewBidsTab extends StatefulWidget {
  const ViewBidsTab({super.key});

  @override
  State<ViewBidsTab> createState() => _ViewBidsTabState();
}

class _ViewBidsTabState extends State<ViewBidsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        image: DecorationImage(
          image: AssetImage('assets/images/view_bids.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
