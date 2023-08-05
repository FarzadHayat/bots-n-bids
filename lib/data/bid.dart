import 'profile.dart';
import 'team.dart';

class Bid {
  Bid({
    required this.profile,
    required this.amount,
    required this.team,
  });

  int amount = 0;
  Profile profile;
  Team team;
}
