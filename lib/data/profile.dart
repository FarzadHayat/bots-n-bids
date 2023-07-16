import 'package:bots_n_bids/pages/signup_page.dart';

enum MemberType { Spectator, Judge }


class Profile {
  Profile({
    required this.name,
    required this.email,
    required this.password,
    required this.memberType,
  });

  int coins = 125;
  String name = 'John Doe';
  String email = 'johndoe@something.com';
  String password = 'password';
  MemberType memberType = MemberType.Spectator;
}
