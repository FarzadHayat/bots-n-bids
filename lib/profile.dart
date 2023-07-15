import 'package:bots_n_bids/signup_page.dart';

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
  Member memberType = Member.Spectator;
}
