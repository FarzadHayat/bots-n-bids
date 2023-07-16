import 'package:bots_n_bids/data/profile.dart';
import 'package:bots_n_bids/pages/signup_page.dart';
import 'package:bots_n_bids/data/team.dart';

class Globals {
  static final Globals _instance = Globals._internal();

  factory Globals() {
    return _instance;
  }

  Globals._internal();

  List<Profile> profiles = [];
  List<Team> teams = [];

  Profile currentProfile = Profile(
    name: 'John Doe',
    email: 'johndoe@gmail.com',
    password: 'password',
    memberType: MemberType.Judge,
  );
  bool isLoggedIn = false;

  List<Team> getTeams() {
    return teams;
  }

  void addTeam(Team team) {
    teams.add(team);
  }

  void login(Profile profile) {
    currentProfile = profile;
    isLoggedIn = true;
  }

  void logout() {
    isLoggedIn = false;
  }

  void addProfile(Profile) {

  }
}
