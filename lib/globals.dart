import 'package:bots_n_bids/profile.dart';
import 'package:bots_n_bids/signup_page.dart';
import 'package:bots_n_bids/team.dart';

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
    memberType: Member.Judge,
  );

  List<Team> getTeams() {
    return teams;
  }

  void addTeam(Team team) {
    teams.add(team);
  }
}
