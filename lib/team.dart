import 'package:bots_n_bids/penalty_entry.dart';

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
}
