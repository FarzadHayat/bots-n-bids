import 'package:bots_n_bids/data/profile.dart';
import 'package:bots_n_bids/pages/signup_page.dart';
import 'package:bots_n_bids/data/team.dart';

import 'data/profile.dart';

class Globals {
  static final Globals _instance = Globals._internal();

  factory Globals() {
    return _instance;
  }

  Globals._internal();

  List<Profile> profiles = [];
  List<Team> teams = [];

  late Profile currentProfile = Profile(
    name: 'John Doe',
    email: 'johndoe@gmail.com',
    password: 'password',
    memberType: MemberType.Judge,
  );

  List<Team> getTeams() {
    return teams;
  }

  void addTeam(Team team) {
    teams.add(team);
    teams.sort((a, b) => a.time.compareTo(b.time));
  }
}
