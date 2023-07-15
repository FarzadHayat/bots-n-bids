import 'dart:html';
import 'package:bots_n_bids/signup_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int coins = 125;
  String username = 'JohnDoe';
  String email = 'johndoe@something.com';
  Member memberType = Member.Spectator;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        image: DecorationImage(
          image: AssetImage('assets/images/judge-profile.jpg'),
          fit: BoxFit.contain,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                (memberType == Member.Spectator)
                    ? 'Welcome Viewer!'
                    : 'Welcome Judge!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                )),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text('USERNAME:', style: kText),
                SizedBox(width: 5.0),
                Text('$username', style: kText),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text('EMAIL:', style: kText),
                SizedBox(width: 5.0),
                Text('$email', style: kText),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.star), // Replace with your desired icon
                    SizedBox(
                        width:
                            8.0), // Adjust the spacing between the icon and the text
                    Text(
                      '$coins', // Convert the int variable to a String using string interpolation
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: (() => {}),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith(
                          (states) => Colors.white),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'View Bids',
                      style: TextStyle(
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
