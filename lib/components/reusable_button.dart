import 'package:bots_n_bids/constants.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatefulWidget {
  const ReusableButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.icon,
  }) : super(key: key);

  final String text;
  final Function onPress;
  final Image? icon;

  @override
  State<ReusableButton> createState() => _ReusableButtonState();
}

class _ReusableButtonState extends State<ReusableButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
        padding: MaterialStateProperty.resolveWith(
            (states) => const EdgeInsets.all(10.0)),
        side: MaterialStateProperty.resolveWith((states) => const BorderSide(
              color: kPrimaryColor,
              width: 3.0,
            )), // Adjust border width
        shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Customize border radius if needed
                )),
      ),
      onPressed: () {
        widget.onPress();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: widget.icon,
          ),
          Text(
            widget.text,
            style: kText.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
