import 'package:bots_n_bids/pages/signup_page.dart';

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