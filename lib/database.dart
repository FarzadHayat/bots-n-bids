import 'package:bots_n_bids/data/profile.dart';
import 'package:bots_n_bids/data/team.dart';

class Globals {
  static final Globals _instance = Globals._internal();

  factory Globals() {
    return _instance;
  }

  Globals._internal();

  final List<Profile> _profiles = [
    Profile(
        memberType: MemberType.Spectator, email: 'a', name: 'a', password: 'a'),
    Profile(memberType: MemberType.Judge, email: 'b', name: 'b', password: 'b'),
  ];
  List<Team> teams = [
    Team(
      'Apples',
      '0:47',
    ),
    Team(
      'Oranges',
      '1:09',
    ),
    Team(
      'Bananas',
      '1:13',
    ),
    Team(
      'Cherries',
      '1:46',
    ),
  ];

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

  void addProfile(Profile profile) {
    _profiles.add(profile);
  }

  List<Profile> getProfiles() {
    return _profiles;
  }
}
