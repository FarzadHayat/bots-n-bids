import 'package:bots_n_bids/components/penalty_entry.dart';

class Team {
  Team(this.name, this.time);

  // List<int> lapTimes = [];
  final String name;
  final String time;

  // void addLap({
  //   required int timeInSeconds,
  //   required List<PenaltyEntry> penalties,
  // }) {
  //   int totalTime = timeInSeconds;
  //   for (PenaltyEntry penalty in penalties) {
  //     totalTime += penalty.count * penalty.increment;
  //   }
  //   lapTimes.add(totalTime);
  // }

  // List<int> getLapTimes() {
  //   return lapTimes;
  // }
  //
  // int getBestLapTime() {
  //   return lapTimes.reduce(
  //       (currentMax, element) => currentMax > element ? currentMax : element);
  // }

  // String getLapTimeAsString() {
  //   String minutes = (getBestLapTime() / 60).floor().toString();
  //   String seconds = (getBestLapTime() % 60).toString();
  //   if (seconds.length < 2) {
  //     seconds = '0$seconds';
  //   }
  //   return '$minutes:$seconds';
  // }
}
