import 'package:flutter/material.dart';

const kTextHeader = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Tektur',
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kTextBody = TextStyle(
  fontSize: 18.0,
  color: Colors.white,
  fontFamily: 'Tektur',
);

const kTextPenaltyEntry = TextStyle(
  fontSize: 14.0,
  fontFamily: 'Tektur',
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kColorButton = Color(0xff090c22);
const kColorBackground = Color(0xff282a3b);
const kColorForeground = Color(0xff2d90eb);
const kColorAccent = Color(0xffea1556);
const kColorHighlight = Color(0xfffdad03);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorHighlight, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kColorHighlight, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
