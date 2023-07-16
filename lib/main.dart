import 'package:flutter/material.dart';

import 'pages/bidder_page.dart';
import 'data/profile.dart';
import 'pages/home_page.dart';
import 'pages/signup_page.dart';
import 'pages/welcome_page.dart';
import 'pages/login_page.dart';

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
              memberType: MemberType.Spectator,
            ),
        '/judge_login': (context) => const LoginPage(
              memberType: MemberType.Judge,
            ),
        '/signup': (context) => const SignUpPage(),
        '/bidder_home': (context) => const BidderPage(),
        '/judge_home': (context) => const HomePage(),
      },
      initialRoute: '/welcome',
    );
  }
}
