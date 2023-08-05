import 'package:bots_n_bids/pages/signup_page.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../constants.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  static const String id = 'welcome_page';

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Center(
                  child: Text(
                    'Hi!',
                    style: kTextHeader,
                  ),
                ),
                const SizedBox(height: 20.0),
                RoundedButton(
                  color: kColorButton,
                  title: "LOG IN",
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  },
                ),
                RoundedButton(
                  color: kColorButton,
                  title: "SIGN UP",
                  onPressed: () {
                    Navigator.pushNamed(context, SignupPage.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
