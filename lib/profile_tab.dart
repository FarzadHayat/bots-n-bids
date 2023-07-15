import 'package:bots_n_bids/profile.dart';
import 'package:bots_n_bids/signup_page.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'globals.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile profile = Globals().currentProfile;

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
        padding: const EdgeInsets.only(
          left: 40.0,
          right: 40.0,
          bottom: 40.0,
          top: 200.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                (profile.memberType == Member.Spectator)
                    ? 'Welcome Viewer!'
                    : 'Welcome Judge!',
                style: kTextBodyHeader),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text('USERNAME:', style: kText),
                SizedBox(width: 5.0),
                Text('${profile.name}', style: kText),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const Text('EMAIL:', style: kText),
                SizedBox(width: 5.0),
                Text('${profile.email}', style: kText),
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
                    Image.asset(
                      'assets/icons/points.png',
                      width: 50.0,
                      height: 50.0,
                    ), // Replace with your desired icon
                    SizedBox(
                        width:
                            8.0), // Adjust the spacing between the icon and the text
                    Text(
                      '${profile.coins}', // Convert the int variable to a String using string interpolation
                      style: kText,
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                    padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.all(
                        10.0,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/bids.png',
                        width: 50.0,
                        height: 50.0,
                      ),
                      const Text(
                        'View Bids',
                        style: TextStyle(
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                    padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.all(
                        10.0,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'View Bids',
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.white),
                    padding: MaterialStateProperty.resolveWith(
                      (states) => EdgeInsets.all(
                        10.0,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'View Bids',
                    style: TextStyle(
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
