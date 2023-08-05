import 'package:bots_n_bids/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key?
        key, // Make sure to use the correct syntax for the named parameter "key".
    required this.color,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final Color color;
  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: kColorForeground,
            width: 3.0,
          ),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: kTextBody,
          ),
        ),
      ),
    );
  }
}
