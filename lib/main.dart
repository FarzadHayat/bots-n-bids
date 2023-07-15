import 'package:flutter/material.dart';

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
      title: 'Bots \'n Babes',
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
      },
      initialRoute: '/welcome',
    );
  }
}
