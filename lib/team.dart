import 'package:bots_n_bids/penalty_entry.dart';

import 'dart:math';

class Team {
  Team({required this.name});

  final List<int> _lapTimes = [];
  final String name;

  void addLap({
    required int timeInSeconds,
    required List<PenaltyEntry> penalties,
  }) {
    int totalTime = timeInSeconds;
    for (PenaltyEntry penalty in penalties) {
      totalTime += penalty.score;
    }
    _lapTimes.add(totalTime);
  }

  List<int> getLapTimes() {
    return _lapTimes;
  }

  int getBestLapTime() {
    return _lapTimes.reduce(
        (currentMax, element) => currentMax > element ? currentMax : element);
  }

  String getLapTimeAsString() {
    String minutes = (getBestLapTime() / 60).floor().toString();
    String seconds = (getBestLapTime() % 60).toString();
    if (seconds.length < 2) {
      seconds = '0$seconds';
    }
    return '$minutes:$seconds';
  }
}
