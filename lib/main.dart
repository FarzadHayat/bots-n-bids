import 'package:flutter/material.dart';

import 'pages/bidder_page.dart';
import 'pages/home_page.dart';
import 'pages/signup_page.dart';
import 'pages/welcome_page.dart';
import 'pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const BotsNBids());
}

class BotsNBids extends StatelessWidget {
  const BotsNBids({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bots \'n\' Babes',
      routes: {
        WelcomePage.id: (context) => const WelcomePage(),
        LoginPage.id: (context) => const LoginPage(),
        SignupPage.id: (context) => const SignupPage(),
        BidderPage.id: (context) => const BidderPage(),
        HomePage.id: (context) => const HomePage(),
      },
      initialRoute: WelcomePage.id,
    );
  }
}
