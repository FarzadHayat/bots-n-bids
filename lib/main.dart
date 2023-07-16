import 'package:flutter/material.dart';

import 'bidder_page.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'signup_page.dart';
import 'welcome_page.dart';

void main() {
  runApp(const BotsNBids());
}

class BotsNBids extends StatelessWidget {
  const BotsNBids({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bots \'n Babes',
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/bidder_login': (context) => const LoginPage(
              memberType: Member.Spectator,
            ),
        '/judge_login': (context) => const LoginPage(
              memberType: Member.Judge,
            ),
        '/signup': (context) => const SignUpPage(),
        '/bidder_home': (context) => const BidderPage(),
        '/judge_home': (context) => const HomePage(),
      },
      initialRoute: '/welcome',
    );
  }
}
